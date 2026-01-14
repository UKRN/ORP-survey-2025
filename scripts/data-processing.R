library(tidyverse) # data processing
source("scripts/levels.R")

# survey data ----

## import data and factor single-column factors
survey <- list.files("data-raw", "FINAL", full.names = TRUE)

## deal with multi-line headers
n <- read_csv(survey, n_max = 1, show_col_types = FALSE)

ct <- cols(StartDate = col_character(),
           EndDate = col_character(),
           RecordedDate = col_character())


## import additional files
read_hei <- function(pattern) {
  list.files("data-raw", pattern, full.names = TRUE) |>
    read_csv(skip = 3, col_names = names(n), col_types = ct)
}
glasgow <- read_hei("GLASGOW")
oxford  <- read_hei("OXFORD")
kings   <- read_hei("KINGS")


# read full dataset ----
data <- read_csv(survey, skip = 3,
                 col_names = names(n),
                 col_types = ct) |>
  bind_rows(glasgow, oxford, kings) |>
  filter(!is.na(Consent),
         !is.na(Institution),
         # inclusion criterion of completing this item (removes 185 people)
         !is.na(`Awareness_Use_BORS#1_1`)) |>
  mutate(
    Institution      = replace_na(Institution, na_text),
    Institution      = factor(Institution, institutions),
    Discipline_BORS  = replace_na(Discipline_BORS, na_text),
    Discipline_BORS  = factor(Discipline_BORS, disciplines, names(disciplines)),
    Quant_Quali_BORS = replace_na(Quant_Quali_BORS, na_text),
    Quant_Quali_BORS = factor(Quant_Quali_BORS, qq, names(qq)),
    Career_level     = replace_na(Career_level, na_text),
    Career_level     = factor(Career_level, career_levels, names(career_levels))
  ) |>
  filter(Institution %in% institutions)


# redact data ----
redact <- data |>
  select(
    -Department,
    -Methods_27_TEXT,
    -Facilitators_BORS_34_TEXT,
    -Comments,
    -starts_with("X")
  ) |>

  mutate(
    Discipline_category = discipline_cat[as.character(Discipline_BORS)],
    across(starts_with("Methods_"), \(x) ifelse(is.na(x), FALSE, TRUE)),
    across(starts_with("Facilitators_"), \(x) ifelse(is.na(x), FALSE, TRUE))
  ) |>

  select(
    ResponseId,
    Institution,
    Career_level,
    Research_approach = Quant_Quali_BORS,
    Discipline = Discipline_BORS,
    Discipline_category,
    `Awareness_Use_BORS#1_1`:Methods_27
  ) |>

  ## recode columns ----
  rename_with(\(x) {
  n <- sub("Awareness_Use_BORS#1_", "", x) |> as.numeric()
  sprintf("Awareness_%s", gsub(" ", "_", practices[n]))
  }, starts_with("Awareness_Use_BORS#1_")) |>

  rename_with(\(x) {
    n <- sub("Awareness_Use_BORS#2_", "", x) |> as.numeric()
    sprintf("Use_%s", gsub(" ", "_", practices[n]))
  }, starts_with("Awareness_Use_BORS#2_")) |>

  rename_with(\(x) {
    sprintf("Attitudes_%s", attitude_levels[x])
  }, starts_with("Attitudes_")) |>

  rename_with(\(x) {
    sprintf("Attitudes_%s", attitude_levels[x])
  }, starts_with("Hiring")) |>

  rename_with(\(x) {
    n <- sub("Methods_", "", x) |> as.numeric()
    n <- ifelse(n < 20, n - 14, n - 15)
    sprintf("Methods_%s", gsub(" ", "_", meth_levels[n]))
  }, starts_with("Methods_")) |>

  rename_with(\(x) {
    n <- sub("Facilitators_BORS_", "", x) |> as.numeric()
    n <- match(n, c(20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34))
    sprintf("Facilitators_%s", gsub(" ", "_", facilitators_levels[n]))
  }, starts_with("Facilitators_BORS_"))


# Institution data ----
details <- read_csv("data-raw/2025-ORP-survey-details.csv") |>
  mutate(Institution = factor(Organisation, institutions)) |>
  select(Institution, n_surveyed = 7, n_staff = 8, n_pgr = 9)

inst_data <- data |>
  count(Institution) |>
  arrange(Institution) |>
  left_join(details, by = "Institution")

write_csv(inst_data, "data/_inst_data.csv")

# data for consolidated report ----
sharable <- redact |>
  # exclude UEA from full report because convenience sample
  filter(Institution != "University of East Anglia") |>
  select(-Institution)

write_csv(sharable, "data/ukrn_survey_2025_all.csv")

# data for institutional reports ----

filename <- institutions |>
  gsub("Royal Veterinary College", "RVC", x = _) |>
  gsub("King's College London", "Kings", x = _) |>
  gsub("University College London \\(UCL\\)", "UCL", x = _) |>
  gsub("University", "", x = _) |>
  gsub("of", "", x = _) |>
  gsub(" ", "", x = _)
names(filename) <- institutions

write_inst_csv <- function(inst) {
  idata <- redact |>
    filter(Institution == inst) |>
    select(-Institution)

  ifile <- file.path("data", paste0("ukrn_survey_2025_", filename[inst], ".csv"))
  write_csv(idata, ifile)
}

for (i in institutions) {
  write_inst_csv(i)
}
