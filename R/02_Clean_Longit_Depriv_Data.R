
# read 2015/2016 data ----------------------------------------------------------

## Stored within an excel file with multiple sheets

# referrals received by deprivation within table13A
# skipped headers
# restricted to only first 10 rows as this is England-level data
Referrals_IAPT_15_16_raw <- read_excel(here("Data", "Raw_Annual_Data", "psych-ther-ann-rep-tab-2015-16-v2.xlsx"), sheet = "Table 13a", skip = 9, n_max = 11)

# tidy up data formating for consistency
Referrals_Depriv_England_IAPT_15_16 <- Referrals_IAPT_15_16_raw %>%
  remove_empty("cols") %>%
  rename(OrgType = "CCG Name") %>%
  rename(VariableA = "Indices of Deprivation decile") %>%
  filter(VariableA != "Unknown IMD") %>%
  rename(CountReferralsReceived = "Referrals received") %>%
  add_column(Year = "2015/2016") %>%
  mutate(OrgType = str_replace(OrgType, "England total", "England"))


# treatment values by deprivation within table13B
# skipped headers
# restricted to only first 10 rows as this is England-level data
Treatment_IAPT_15_16_raw <- read_excel(here("Data", "Raw_Annual_Data", "psych-ther-ann-rep-tab-2015-16-v2.xlsx"), sheet = "Table 13b", skip = 11, n_max = 11)

# add back in meaningful headers
names(Treatment_IAPT_15_16_raw) <- c("OrgType", "VariableA", "CountFinishedCourseTreatment", "CountImprovement", "PercentageImprovement", "CountNoReliableChange", "PercentageNoReliableChange", "CountDeterioration", "PercentageDeterioration", "CountAtCaseness", "CountNotAtCaseness", "CountRecovery", "PercentageRecovery", "CountReliableRecovery", "PercentageReliableRecovery")

# tidy up data formating for consistency
Treatment_Depriv_England_IAPT_15_16 <- Treatment_IAPT_15_16_raw %>%
  add_column(Year = "2015/2016") %>%
  filter(VariableA != "Unknown IMD") %>%
  mutate(OrgType = str_replace(OrgType, "England total", "England"))

# combine referral and treatment data
Depriv_England_IAPT_15_16 <- cbind(Referrals_Depriv_England_IAPT_15_16, Treatment_Depriv_England_IAPT_15_16)

# read 2016/2017 data ----------------------------------------------------------

## Stored within an folder, containing with multiple csvs
# referrals received by deprivation within table13A
Referrals_IAPT_16_17_raw <- read_csv(here("Data", "Raw_Annual_Data", "psych-ther-ann-rep-csv-pack-2016-17", "psych-ther-ann-2016-17-table-13a.csv"), na = c("*", "", "NULL", "-"))


# tidy up data formating for consistency
Referrals_Depriv_England_IAPT_16_17 <- Referrals_IAPT_16_17_raw %>%
  rename(OrgType = "CCGName") %>%
  rename(VariableA = "IMD") %>%
  filter(VariableA != "Unknown IMD") %>%
  rename(CountReferralsReceived = "ReferralsReceived") %>%
  rename(CountFinishedCourseTreatment = "FinishedCourseTreatment") %>%
  add_column(Year = "2016/2017") %>%
  filter(OrgType == "England") %>%
  select(-CCG)


# treatment values by deprivation within table13B
Treatment_IAPT_16_17_raw <- read_csv(here("Data", "Raw_Annual_Data", "psych-ther-ann-rep-csv-pack-2016-17", "psych-ther-ann-2016-17-table-13b.csv"), na = c("*", "", "NULL", "-"))


# tidy up data formating for consistency
Treatment_Depriv_England_IAPT_16_17 <- Treatment_IAPT_16_17_raw %>%
  rename(OrgType = "CCGName") %>%
  rename(VariableA = "IMD") %>%
  add_column(Year = "2016/2017") %>%
  filter(OrgType == "England") %>%
  filter(VariableA != "Unknown IMD") %>%
  select(-CCG) %>%
  rename(CountFinishedCourseTreatment = "FinishedCourseTreatment") %>%
  rename(CountImprovement = "Improvement") %>%
  rename(PercentageImprovement = "ImprovementRate") %>%
  rename(CountNoReliableChange = "NoReliableChange") %>%
  rename(PercentageNoReliableChange = "NoReliableChangeRate") %>%
  rename(CountDeterioration = "Deterioration") %>%
  rename(PercentageDeterioration = "DeteriorationRate") %>%
  rename(CountAtCaseness = "StartedCaseness") %>%
  rename(CountNotAtCaseness = "StartedNotCaseness") %>%
  rename(CountRecovery = "Recovery") %>%
  rename(PercentageRecovery = "RecoveryRate") %>%
  rename(CountReliableRecovery = "ReliableRecovery") %>%
  rename(PercentageReliableRecovery = "ReliableRecoveryRate")

# combine referral and treatment data
Depriv_England_IAPT_16_17 <- cbind(Referrals_Depriv_England_IAPT_16_17, Treatment_Depriv_England_IAPT_16_17)

# read 2017/2018 data ------------------------------------------------------------------

IAPT_17_18_raw <- read_csv(here("Data", "Raw_Annual_Data", "psych-ther-ann-rep-csv-2017-18-main-csv.csv"), na = c("*", "", "NULL", "-"))

# tidy up data formating for consistency
Depriv_England_IAPT_17_18 <- IAPT_17_18_raw %>%
  filter(OrgType == "England") %>%
  filter(VariableType == "Indices of Deprivation Decile") %>%
  filter(VariableA != "Not stated/Not known/Invalid") %>%
  remove_empty("cols") %>%
  add_column(Year = "2017/2018")


# read 2018-19 data ------------------------------------------------------------------
IAPT_18_19_raw <- read_csv(here("Data", "Raw_Annual_Data", "psych-ther-ann-rep-csv-2018-19-main-csv.csv"), na = c("*", "", "NULL", "-"))

# tidy up data formating for consistency
Depriv_England_IAPT_18_19 <- IAPT_18_19_raw %>%
  filter(OrgType == "England") %>%
  filter(VariableType == "Indices of Deprivation Decile") %>%
  filter(VariableA != "Not stated/Not known/Invalid") %>%
  remove_empty("cols") %>%
  add_column(Year = "2018/2019")


# Combine longitudinal data -----------------------------------------------

myCols <- c("Year", "VariableA", "CountReferralsReceived", "CountFinishedCourseTreatment", "CountNotAtCaseness", "PercentageRecovery")

Long_Depriv_England <- bind_rows(Depriv_England_IAPT_15_16, Depriv_England_IAPT_16_17, Depriv_England_IAPT_17_18, Depriv_England_IAPT_18_19) %>%
  select(match(myCols, names(.)))

Long_Depriv_England <- group_by(Long_Depriv_England, Year) %>%
  mutate(PercentNotCase = (CountNotAtCaseness / CountFinishedCourseTreatment) * 100) %>%
  mutate(PercentReferralsReceived = (CountReferralsReceived / sum(CountReferralsReceived)) * 100) %>%
  ungroup()

