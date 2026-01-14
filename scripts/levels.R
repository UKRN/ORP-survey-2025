# levels for setting factor order

na_text <- "(Missing)"

# institutions ----

institutions <- c(
  # "University of Aberdeen",
  "University of Bristol",
  "Cardiff University",
  "University of East Anglia",
  "University of Edinburgh",
  "University of Glasgow",
  "Keele University",
  "King's College London",
  "University of Leeds",
  # "University of Leicester",
  "University of Liverpool",
  #  "University of Manchester",
  "Newcastle University",
  #  "Northumbria University",
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
  #na_text
)

# disciplines ----
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
  "Physical sciences (e.g., physics, astronomy, chemistry, earth sciences)",
  na_text
)
names(disciplines) <- sub(" \\(.*\\)", "", disciplines)

discipline_cat <- c("Arts and Humanities",
                    "Social Sciences",
                    "Health & Biological Sciences",
                    "Physical Sciences") |>
  rep(times = c(6, 7, 6, 4)) |>
  c(NA)
names(discipline_cat) <- sub(" \\(.*\\)", "", disciplines)

# practices ----
practices <- c(
  "Open Research",
  "Preregistration",
  "Open Material",
  "Open Protocols",
  "Open Data",
  "FAIR Data",
  "Open Code/Software",
  "Preprints",
  "Open Peer Review",
  "Open Access",
  "Replication Studies",
  "Co-production",
  "Recognising Contributions",
  "Citizen Science"
)

# detailed research methods ----
meth_levels <- c(
  "Archival / primary source",
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

# research approaches (qq) ----
qq <- c(
  "Quantitative (i.e., collecting and/or analysing numerical data using mathematical or statistical methods)",
  "Qualitative (i.e., interpretation of text or other materials without relying on numerical measurement)",
  "Both",
  "Neither / unsure",
  na_text
)
names(qq) <- c("Quantitative", "Qualitative", "Both", "Neither", na_text)

# career levels ----
career_levels <- c(
  "Junior (for example: PhD student, early career post-doctoral researcher, early career research assistant, junior technician)",
  "Mid (for example: senior or mid-career post-doctoral researcher, senior or mid-career research assistant, lab manager, research fellow, senior research fellow, lecturer, senior technician)",
  "Senior (for example: senior lecturer, reader, professor)",
  na_text
)
names(career_levels) <- sub(" \\(.*\\)", "", career_levels)

# attitudes ----
attitude_levels <- c(
  "Usefulness",
  "Participation",
  "Confidence",
  "Comprehension",
  "Support",
  "Training",
  "Norms",
  "Resources",
  "Assessment"
)

names(attitude_levels) <- paste0("Attitudes_", 1:8) |>
  c("Hiring/promotion_1")

# facilitators ----

facilitators_levels <- c("Guidance",
                        "Training",
                        "Ethical clarity",
                        "Prioritisation",
                        "Infrastructure",
                        "Time allocation",
                        "Incentives",
                        "Recognition",
                        "Peer support",
                        "Disciplinary norms",
                        "No intention",
                        "Already engaged",
                        "Something else")
