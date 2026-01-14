library(tidyverse)
library(faux)

institutions <- c(
  "University of Aberdeen",
  "University of Bristol",
  "Cardiff University",
  "University of East Anglia",
  "University of Edinburgh",
  "University of Glasgow",
  "Keele University",
  "King's College London",
  "University of Leeds",
  "University of Leicester",
  "University of Liverpool",
  "University of Manchester",
  "Newcastle University",
  "Northumbria University",
  "University of Oxford",
  "Oxford Brookes University",
  "University of Reading",
  "Royal Veterinary College",
  "University of Sheffield",
  "University of Southampton",
  "University of Surrey",
  "University of Sussex",
  "University College London (UCL)",
  "University of Wolverhampton"
)

disciplines <- c(
  "Archaeology",
  "Communications and media",
  "Design, creative and performing arts",
  "History and classics",
  "Literature, language and area studies",
  "Philosophy and religious studies",
  "Architecture, building and planning",
  "Business and management (e.g., human resource management, tourism, transport and travel, finance)",
  "Economics",
  "Education and teaching",
  "Geography and environmental studies",
  "Law",
  "Social sciences (e.g., sociology, anthropology, cultural studies, politics, social work)",
  "Agriculture and food science",
  "Biosciences (e.g., biology, ecology, microbiology, plant sciences, sport sciences, zoology)",
  "Medicine and dentistry",
  "Medical-allied subjects (e.g., biomedical sciences, public health, nursing, pharmacology, physiology)",
  "Psychology and neuroscience",
  "Veterinary sciences",
  "Computing and information sciences",
  "Engineering and technology (e.g., materials, biotechnology)",
  "Mathematical sciences",
  "Physical sciences (e.g., physics, astronomy, chemistry, earth sciences)"
)
names(disciplines) <- sub(" \\(.*\\)", "", disciplines)


methods <- c(
  "Archival research / primary source analysis (including material objects)",
  "Case study analysis",
  "Experimental methods",
  "Interview methods",
  "Meta-analysis / research synthesis",
  "Observational methods",
  "Practise-based research",
  "Probabilistic / simulation methods",
  "Secondary source analysis",
  "Survey based methods",
  "Theoretical research",
  "Other"
)
names(methods) <- c("Archival / primary source", methods[2:12])

qq <- c(
  quantitative = "Quantitative (i.e., collecting and/or analysing numerical data using mathematical or statistical methods)",
  qualitative = "Qualitative (i.e., interpretation of text or other materials without relying on numerical measurement)",
  both = "Both",
  neither = "Neither / unsure"
)

career <- c(
  "Junior (for example: PhD student, early career post-doctoral researcher, early career research assistant, junior technician)",
  "Mid (for example: senior or mid-career post-doctoral researcher, senior or mid-career research assistant, lab manager, research fellow, senior research fellow, lecturer, senior technician)",
  "Senior (for example: senior lecturer, reader, professor)"
)
names(career) <- sub(" \\(.*\\)", "", career)


# set up data simulation
filename <- "OXFORD+-+UKRN+Survey+on+Open+and+Transparent+Research+Practices_May+15,+2025_14.04.csv"

n <- read_csv(filename, n_max = 1, show_col_types = FALSE)
d <- read_csv(filename, skip = 3, col_names = names(n), show_col_types = FALSE)

# simulation
n <- 5000

demog <- data.frame(
  ResponseId = make_id(n, "ID"),
  Institution = institutions |> sample(n, T),
  Discipline_BORS = disciplines |> sample(n, T),
  Quant_Quali_BORS = qq |> sample(n, T),
  Career_level = career |> sample(n, T)
)

aware1 <- c("Yes", "No")

a1 <- add_random(ResponseId = demog$ResponseId) |>
  add_random(`Awareness_Use_BORS#1_` = 14) |>
  mutate(value = sample(aware1, n*14, T)) |>
  messy(.1, "value") |>
  rename(name = 2) |>
  mutate(name = sub("_0", "_", name)) |>
  pivot_wider()

aware2 <- c(
  "I use it often",
  "I have used it",
  "I have NOT used it",
  "Not applicable to my research"
)

a2 <- add_random(ResponseId = demog$ResponseId) |>
  add_random(`Awareness_Use_BORS#2_` = 14) |>
  mutate(value = sample(aware2, n*14, T)) |>
  messy(.1, "value") |>
  rename(name = 2) |>
  mutate(name = sub("_0", "_", name)) |>
  pivot_wider()

agree <- c(
  "Strongly agree",
  "Somewhat agree",
  "Neutral",
  "Somewhat disagree",
  "Strongly disagree"
)

att <- add_random(ResponseId = demog$ResponseId) |>
  add_random(`Attitudes_` = 8) |>
  mutate(value = sample(agree, n*8, T)) |>
  messy(.1, "value") |>
  rename(name = 2) |>
  mutate(name = sub("_0", "_", name)) |>
  pivot_wider()

data <- demog |>
  left_join(a1, by = "ResponseId") |>
  left_join(a2, by = "ResponseId") |>
  left_join(att, by = "ResponseId") |>
  mutate(`Hiring/promotion_1` = sample(c(agree, "Not applicable"), n, T))

# add facilitators
fac <- grepl("Facilitators_BORS_\\d{2}$", names(d))
fac_cols <- names(d[fac])

for (i in fac_cols) {
  data[i] <- sample(d[[i]], n, T)
}

# add methods
m <- grepl("Methods_\\d{2}$", names(d))
m_cols <- names(d[m])

for (i in m_cols) {
  data[i] <- sample(d[[i]], n, T)
}

write_csv(data, "sim_data.csv")
