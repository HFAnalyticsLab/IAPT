
# read 2018-19 data ------------------------------------------------------------------
## @knitr import-2018-19-data
IAPT_18_19 <- read_csv(here::here("Data","Raw_Annual_Data","psych-ther-ann-rep-csv-2018-19-main-csv.csv"), na = c("*", "", "NULL", "-"))



# Process England-level data ----------------------------------------------------

## @knitr select-England-level-data

England_IAPT_18_19 <- IAPT_18_19 %>% 
  filter(OrgType == "England")


## @knitr select-measures-of-interest

# percentage who finished their treatment
England_IAPT_18_19$PercentFinishedTreatment <- (England_IAPT_18_19$CountFinishedCourseTreatment / England_IAPT_18_19$CountEndedReferrals) *100

## percentage of people treated that were not cases
England_IAPT_18_19$PercentNotCase <- (England_IAPT_18_19$CountNotAtCaseness / England_IAPT_18_19$CountFinishedCourseTreatment) *100

measure_var<-c("CountEndedReferrals","CountFinishedCourseTreatment","PercentFinishedTreatment","PercentNotCase","PercentageRecovery","MeanTreatmentAppointments")


## @knitr waiting-times

Mean_Wait_IAPT_18_19 <- England_IAPT_18_19 %>% 
  filter(VariableType == "Waiting Time") %>%
  filter(VariableB == "Mean Wait") %>%
  remove_empty("cols")


Wait_IAPT_18_19 <- England_IAPT_18_19 %>% 
  filter(VariableType == "Waiting Time") %>%
  filter(VariableB == "<6 weeks" | VariableB == "<18 weeks" ) %>%
  remove_empty("cols")


## @knitr totals
Total_England <- England_IAPT_18_19 %>%
  filter(VariableType == "Total")

# Process deprivation-level data  --------------------------------------------------------


## @knitr select-deprivation-data
Depriv_England_IAPT_18_19 <- England_IAPT_18_19 %>% 
  filter(VariableType == "Indices of Deprivation Decile") %>%
  filter(VariableA != "Not stated/Not known/Invalid") %>% 
  remove_empty("cols")

## @knitr run-deprivation-plots
Subset_IAPT_Data<-Depriv_England_IAPT_18_19
n_factor<-length(unique(Subset_IAPT_Data$VariableA))

plot_list=list() 
plot_list[[1]] <- bar_fun_stack(Subset_IAPT_Data, "VariableA", "CountEndedReferrals", "CountFinishedCourseTreatment")
plot_list[[2]]<- bar_fun2(Subset_IAPT_Data, "VariableA", measure_var[3]) + labs(y = "Percentage Receiving Treatment") #+ ylim(0, 51) + geom_hline(yintercept = Total_England$PercentFinishedTreatment, colour="black", linetype = "dashed")  
plot_list[[3]]<- bar_fun2(Subset_IAPT_Data, "VariableA", measure_var[4]) + labs(y = "Percentage Receiving Treatment, when not case") # + ylim(0, 12) + geom_hline(yintercept = Total_England$PercentNotCase, colour="black", linetype = "dashed")  
plot_list[[4]] <- bar_fun2(Subset_IAPT_Data, "VariableA", measure_var[5]) + geom_hline(yintercept = 50, colour="black")  + labs(y = "Percentage Achieving Recovery") # + ylim(0, 70) + geom_hline(yintercept = Total_England$PercentageRecovery, colour="black", linetype = "dashed")

## @knitr depriv-plot-referral-treatment
plot_grid(plotlist=plot_list[c(1:2)],
          align = 'vh',
          labels = c('A', 'B'),
          hjust = -1,
          nrow = 1)


## @knitr depriv-plot-not-case
print(plot_list[[3]])

## @knitr depriv-plot-recovery
print(plot_list[[4]])
