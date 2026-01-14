# Survey results from all institutions

The combined survey results from all institutions are available in the file `data/ukrn_survey_2025_all.csv`.

| Variable | Description | Type | Values / Notes |
|----------------|------------------|----------------|-----------------------|
| ResponseId | Unique identifier for each survey response | String | There are 1408 responses in the data |
| Career_level | Career level of the respondent. The survey defined the options in the following way: Junior (for example: PhD student, early career post-doctoral researcher, early career research assistant, junior technician); Mid (for example: senior or mid-career post-doctoral researcher, senior or mid-career research assistant, lab manager, research fellow, senior research fellow, lecturer, senior technician); Senior (for example: senior lecturer, reader, professor) | String | "Junior", "Mid", "Senior"; "(Missing)" indicates a missing response |
| Research_approach | Response to "How would you describe the research methods you use?" | String | "Quantitative", "Qualitative", "Both", "Neither"; "(Missing)" indicates a missing response |
| Discipline | Response to "What discipline do you do research in? Please pick the discipline most relevant to you, even if it is not a perfect fit." Categories were adapted from the Higher Educatino Statistics Agency. | String | "Agriculture and food science", "Archaeology", "Architecture, building and planning", "Biosciences", "Business and management", "Communications and media", "Computing and information sciences", "Design, creative and performing arts", "Economics", "Education and teaching", "Engineering and technology", "Geography and environmental studies", "History and classics", "Law", "Literature, language and area studies", "Mathematical sciences", "Medical-allied subjects", "Medicine and dentistry", "Philosophy and religious studies", "Physical sciences", "Psychology and neuroscience", "Social sciences", "Veterinary sciences"; "(Missing)" indicates a missing response |
| Discipline_category | Category of the respondent's research discipline, added post-survey in `scripts/data-processing.R` | String | "Arts and Humanities", "Health & Biological Sciences", "Physical Sciences", "Social Sciences" |

**The following fields starting with `Awareness_` are responses to whether the respondent is aware of that particular research practice.**

| Variable | Description | Type | Values / Notes |
|----------|-------------|------|----------------|
| Awareness_Open_Research | Awareness of "Open Research", described as "a general term for many practrices; sometimes referred to as Open Scholarship or, in a more narrow application, Open Science" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Preregistration | Awareness of "Preregistration or Registered Reports", described as "pre-analysis plan, prospective registration; logging your study's aims/hypotheses, methods, and/or analysis plan in a timestamped registry before you conduct the study -- for Registered Reports, the entire study plan is also peer reviewed" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Open_Material | Awareness of "Open Materials", described as "making research materials publicly available, e.g., reagents, questionnaires, interview guides, etc." | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Open_Protocols | Awareness of "Open Protocols", described as "making research methods fully transparent and publicly available, e.g. on an online registry" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Open_Data | Awareness of "Open Data", described as "making research data publicly available; 'data' refers to any information, qualitative or quantitative, collected by your research; including images, recordings, transcripts, text, measurements, etc." | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_FAIR_Data | Awareness of "FAIR Data", described as "making data and/or metadata Findable, Accessible, Interoperable, and Reusable, by both humans and machines); see www.go-fair.org" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Open_Code/Software | Awareness of "Open Code and/or Software", described as "making code used in your research publicly available" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Preprints | Awareness of "Preprints", described as "making research papers available in an online repository prior to journal peer-review; also called working papers" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Open_Peer_Review | Awareness of "Open Peer Review", described as "peer review of publications or grants where reviews are published openly, and/or where authors and reviewers are aware of each other's identity" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Open_Access | Awareness of "Open Access Publication", described as "making peer-reviewed papers or other publications publicly available" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Replication_Studies | Awareness of "Replication Studies", described as "research attempting to reproduce the methods and findings of prior research" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Co-production | Awareness of "Research Co-production", described as "researchers, public and practitioners working together in research, sharing responsibility throughout a project" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Recognising_Contributions | Awareness of "Recognising Contributions", described as "the use of CRediT or authorship statements on publications/outputs, detailing who did what" | String | "Yes", "No"; `NA` indicates a missing response |
| Awareness_Citizen_Science | Awareness of "Citizen Science", described as "collection or analysis of data by the general public as part of a research project" | String | "Yes", "No"; `NA` indicates a missing response |

**The following fields starting with `Use_` are responses to what extent the respondent practices this particular research practice in their research.**

| Variable | Description | Type | Values / Notes |
|----------|-------------|------|----------------|
| Use_Open_Research | Use of "Open Research", described as "a general term for many practices; sometimes referred to as Open Scholarship or, in a more narrow application, Open Science" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Preregistration | Use of "Preregistration or Registered Reports", described as "pre-analysis plan, prospective registration; logging your study's aims/hypotheses, methods, and/or analysis plan in a timestamped registry before you conduct the study -- for Registered Reports, the entire study plan is also peer reviewed" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Open_Material | Use of "Open Materials", described as "making research materials publicly available, e.g., reagents, questionnaires, interview guides, etc." | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Open_Protocols | Use of "Open Protocols", described as "making research methods fully transparent and publicly available, e.g. on an online registry" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Open_Data | Use of "Open Data", described as "making research data publicly available; 'data' refers to any information, qualitative or quantitative, collected by your research; including images, recordings, transcripts, text, measurements, etc." | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_FAIR_Data | Use of "FAIR Data", described as "making data and/or metadata Findable, Accessible, Interoperable, and Reusable, by both humans and machines); see www.go-fair.org" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Open_Code/Software | Use of "Open Code and/or Software", described as "making code used in your research publicly available" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Preprints | Use of "Preprints", described as "making research papers available in an online repository prior to journal peer-review; also called working papers" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Open_Peer_Review | Use of "Open Peer Review", described as "peer review of publications or grants where reviews are published openly, and/or where authors and reviewers are aware of each other's identity" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Open_Access | Use of "Open Access Publication", described as "making peer-reviewed papers or other publications publicly available" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Replication_Studies | Use of "Replication Studies", described as "research attempting to reproduce the methods and findings of prior research" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Co-production | Use of "Research Co-production", described as "researchers, public and practitioners working together in research, sharing responsibility throughout a project" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Recognising_Contributions | Use of "Recognising Contributions", described as "the use of CRediT or authorship statements on publications/outputs, detailing who did what" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |
| Use_Citizen_Science | Use of "Citizen Science", described as "collection or analysis of data by the general public as part of a research project" | String | "I have NOT used it", "I have used it", "I use it often", "Not applicable to my research"; `NA` indicates a missing response |

**The following fields starting with `Attitudes_` are ratings of how much the respondents agree with certain statements about Open Research practices.**

| Variable | Description | Type | Values / Notes |
|----------|-------------|------|----------------|
| Attitudes_Usefulness | Rating of the statement "I think Open Research is useful for researchers like me" | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |
| Attitudes_Participation | Rating of the statement "I would like to participate in Open Research practices more than I already do" | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |
| Attitudes_Confidence | Rating of the statement "I am confident I know how to use Open Research practices in my research" | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |
| Attitudes_Comprehension | Rating of the statement "I understand which Open Research practices would be relevant to use in my research" | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |
| Attitudes_Support | Rating of the statement "I have support from my line manager/supervisor to use Open Research practices in my research" | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |
| Attitudes_Training | Rating of the statement "My institution provides the training I need for best practice in Open Research" | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |
| Attitudes_Norms | Rating of the statement "Open Research practices are expected in my research community (e.g. amoung my research group, department, or peers)" | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |
| Attitudes_Resources | Rating of the statement "I know where to go to learn more about Open Research practices" | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |
| Attitudes_Assessment | Rating of the statement "I have used engagement with Open Research as a criterion when assessing someone else for hiring or promotion, or had engagement with Open Research used as a criterion in my own assessment at my institution " | String | "Strongly disagree", "Somewhat disagree", "Neutral", "Somewhat agree", "Strongly agree"; `NA` indicates a missing response |

**The following fields starting with `Facilitators_` contain whether the respondent selected that a particular thing would help them use more Open Research practices. Respondents could select up to 5.**

| Variable | Description | Type | Values / Notes |
|----------|-------------|------|----------------|
| Facilitators_Guidance | Whether the respondent selected "More, or better organised, **information** and guidance" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Training | Whether the respondent selected "More **training** or mentorship" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Ethical_clarity | Whether the respondent selected "Understanding **ethical** and **legal** issues (e.g. issues around data sharing)" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Prioritisation | Whether the respondent selected "Knowing what practices to **prioritise** / what really matters in my field" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Infrastructure | Whether the respondent selected "**Tools** and infrastructure (e.g. sufficient storage for open data)" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Time_allocation | Whether the respondent selected "More **time** / workload dedicated to open research " | Boolean | `TRUE`, `FALSE` |
| Facilitators_Incentives | Whether the respondent selected "Incentives (e.g., **awards / funding**) from my funder or institution" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Recognition | Whether the respondent selected "Recognition of Open Research in **promotion** and recruitment criteria" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Peer_support | Whether the respondent selected "Support from **colleagues** (e.g., supervisors, students, technicians, administrators, librarians)" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Disciplinary_norms | Whether the respondent selected "More **norms** and positive beliefs in my discipline encouraging open research" | Boolean | `TRUE`, `FALSE` |
| Facilitators_No_intention | Whether the respondent selected "**Nothing**, I do not plan to take up open research practices" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Already_engaged | Whether the respondent selected "**Nothing**, I am already doing everything I think is applicable" | Boolean | `TRUE`, `FALSE` |
| Facilitators_Something_else | Whether the respondent selected "**Something else** (please specify)" | Boolean | `TRUE`, `FALSE` |

**The following fields starting with `Methods_` contain whether the respondent selected that they use a particular research method.**

| Variable | Description | Type | Values / Notes |
|----------|-------------|------|----------------|
| Methods_Archival\_/\_primary_source | Archival research / primary source analysis (including material objects) | Boolean | `TRUE`, `FALSE` |
| Methods_Case_study_analysis | Case study analysis  | Boolean | `TRUE`, `FALSE` |
| Methods_Experimental_methods | Experimental methods | Boolean | `TRUE`, `FALSE` |
| Methods_Interview_methods | Interview methods | Boolean | `TRUE`, `FALSE` |
| Methods_Meta-analysis\_/\_research_synthesis | Meta-analysis / research synthesis | Boolean | `TRUE`, `FALSE` |
| Methods_Observational_methods | Observational methods | Boolean | `TRUE`, `FALSE` |
| Methods_Practise-based_research | Practise-based research | Boolean | `TRUE`, `FALSE` |
| Methods_Probabilistic\_/\_simulation_methods | Probabilistic / simulation methods | Boolean | `TRUE`, `FALSE` |
| Methods_Secondary_source_analysis | Secondary source analysis | Boolean | `TRUE`, `FALSE` |
| Methods_Survey_based_methods | Survey based methods | Boolean | `TRUE`, `FALSE` |
| Methods_Theoretical_research | Theoretical research | Boolean | `TRUE`, `FALSE` |
| Methods_Other | Other | Boolean | `TRUE`, `FALSE` |
