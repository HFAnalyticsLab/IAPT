
# read 2018-19 data ------------------------------------------------------------------

IAPT_18_19 <- read_csv(here("Data", "Raw_Annual_Data", "psych-ther-ann-rep-csv-2018-19-main-csv.csv"), na = c("*", "", "NULL", "-"))

# Process England-level data ----------------------------------------------------

England_IAPT_18_19 <- IAPT_18_19 %>%
  filter(OrgType == "England")

# percentage who finished their treatment
England_IAPT_18_19$PercentFinishedTreatment <- (England_IAPT_18_19$CountFinishedCourseTreatment / England_IAPT_18_19$CountEndedReferrals) * 100

## percentage of people treated that were not cases
England_IAPT_18_19$PercentNotCase <- (England_IAPT_18_19$CountNotAtCaseness / England_IAPT_18_19$CountFinishedCourseTreatment) * 100

Mean_Wait_IAPT_18_19 <- England_IAPT_18_19 %>%
  filter(VariableType == "Waiting Time") %>%
  filter(VariableB == "Mean Wait") %>%
  remove_empty("cols")

Wait_IAPT_18_19 <- England_IAPT_18_19 %>%
  filter(VariableType == "Waiting Time") %>%
  filter(VariableB == "<6 weeks" | VariableB == "<18 weeks") %>%
  remove_empty("cols")

Total_England <- England_IAPT_18_19 %>%
  filter(VariableType == "Total")

# Process deprivation-level data  --------------------------------------------------------

Cross_Depriv_England_IAPT_18_19 <- England_IAPT_18_19 %>%
  filter(VariableType == "Indices of Deprivation Decile") %>%
  filter(VariableA != "Not stated/Not known/Invalid") %>%
  remove_empty("cols")

