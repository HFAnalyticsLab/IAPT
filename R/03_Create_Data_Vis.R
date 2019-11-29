
# recode to match ONS IMD labels ------------------------------------------


# Make 01 *most* deprived, 10 *least* deprived
Cross_Depriv_England_IAPT_18_19$VariableA_recode <- factor(c("10\n(least deprived)", rev(2:9), "1\n(most deprived)"))
Cross_Depriv_England_IAPT_18_19$VariableA_recode <- factor(Cross_Depriv_England_IAPT_18_19$VariableA_recode, levels = c("1\n(most deprived)", 2:9, "10\n(least deprived)"))

Long_Depriv_England$VariableA_recode <- factor(c("10\n(least deprived)", rev(2:9), "1\n(most deprived)"))
Long_Depriv_England$VariableA_recode <- factor(Long_Depriv_England$VariableA_recode, levels = c("1\n(most deprived)", 2:9, "10\n(least deprived)"))

Long_Depriv_England$label[Long_Depriv_England$VariableA_recode == "10\n(least deprived)" & Long_Depriv_England$Year == "2018/2019"] <- "10\n(least\ndeprived)"
Long_Depriv_England$label[Long_Depriv_England$VariableA_recode == "1\n(most deprived)" & Long_Depriv_England$Year == "2018/2019"] <- "1\n(most\ndeprived)"

# Change formatting for years in longit. data
Long_Depriv_England$Year<-gsub('/20', '/', Long_Depriv_England$Year)

# Plot and save figures ------------------------------------------------------------
## Cross-sec 2018/19 data
Percent_Treated <- bar_fun_red_blue_perc(Cross_Depriv_England_IAPT_18_19, "VariableA_recode", "PercentFinishedTreatment") + scale_y_continuous(labels = function(x) paste0(x, "%"), limits = c(0, 50)) + ylab("Percentage of referrals treated")
ggsave(filename = here("Outputs", "Percent_Treated.png"), Percent_Treated, width = 210, height = 150, units = "mm")

Count_Referrals <- bar_fun_red_blue_count(Cross_Depriv_England_IAPT_18_19, "VariableA_recode", "CountEndedReferrals") + scale_y_continuous(labels = scales::comma, limits = c(0, 210000)) + ylab("Number of referrals")
ggsave(filename = here("Outputs", "Count_Referrals.png"), Count_Referrals, width = 215, height = 150, units = "mm")

Count_Treated <- bar_fun_red_blue_count(Cross_Depriv_England_IAPT_18_19, "VariableA_recode", "CountFinishedCourseTreatment") + scale_y_continuous(labels = scales::comma, limits = c(0, 210000)) + ylab("Number of treatments")
ggsave(filename = here("Outputs", "Count_Treated.png"), Count_Treated, width = 215, height = 150, units = "mm")

Percent_Non_Cases <- bar_fun_red_blue_perc(Cross_Depriv_England_IAPT_18_19, "VariableA_recode", "PercentNotCase") + ylab("Percentage of non-case treatments") + scale_y_continuous(labels = function(x) paste0(x, "%"), limits = c(0, 12.5))
ggsave(filename = here("Outputs", "Percent_Non_Cases.png"), Percent_Non_Cases, width = 210, height = 160, units = "mm")

Percent_Recover <- bar_fun_red_blue_perc(Cross_Depriv_England_IAPT_18_19, "VariableA_recode", "PercentageRecovery") + scale_y_continuous(labels = function(x) paste0(x, "%"), limits = c(0, 60)) + ylab("Percentage recovery with treatment") + geom_hline(yintercept = 50, linetype = "dashed")
ggsave(filename = here("Outputs", "Percent_Recover.png"), Percent_Recover, width = 210, height = 160, units = "mm")


## Longit 2015/16 -2018/19 data
Long_Percent_Non_Cases <- line_fun_red_blue(Long_Depriv_England, "PercentNotCase") + ylab("Percentage of non-case treatments") + scale_y_continuous(labels = function(x) paste0(x, "%"), limits = c(0, 12.5))
ggsave(filename = here("Outputs", "Long_Percent_Non_Cases.png"), Long_Percent_Non_Cases, width = 210, height = 160, units = "mm")

Long_Percent_Recover <- line_fun_red_blue(Long_Depriv_England, "PercentageRecovery") + scale_y_continuous(labels = function(x) paste0(x, "%"), limits = c(0, 60)) + ylab("Percentage recovery with treatment") + geom_hline(yintercept = 50, linetype = "dashed")
ggsave(filename = here("Outputs", "Long_Percent_Recover.png"), Long_Percent_Recover, width = 210, height = 160, units = "mm")
