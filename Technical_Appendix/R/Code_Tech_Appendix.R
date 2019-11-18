# set up options ------------------------------------------------------------------

## @knitr libraries
library(tidyverse)
library(janitor)
library(scales)
library(cowplot)
library(magrittr)
library(here)
library(knitr)
library(tidylog)
library(readxl)

here::here()

options(max.print=1000000)
options(scipen=100000)

# ggplot functions ------------------------------------------------------------------

## @knitr ggplot_functions

# Primary palette
THF_red <- '#dd0031'

# Additional elements
THF_dark_grey <- '#524c48'
THF_light_grey <- '#e2dfd8'
THF_50pct_light_grey <- '#EEEDE8' # did this with a color picker

THF_theme_basic <- theme(axis.line = element_blank(),
                         axis.text = element_text(colour = THF_dark_grey),
                         axis.ticks = element_line(colour = THF_light_grey),
                         axis.ticks.y = element_blank(),
                         axis.title = element_text(colour = THF_dark_grey),
                         axis.title.x = element_blank(),
                         panel.background = element_blank(),
                         panel.grid = element_blank(),
                         panel.grid.major.y = element_line(colour = THF_50pct_light_grey)) 

bar_red_labelled = function(dat, x, y) {
  ggplot(data = dat, aes(x = !!sym(x), y = !!sym(y), label=round(!!sym(y),1))) +
    geom_bar(stat = "identity", fill=c('#dd0031')) +
    geom_text(vjust=1.6, color=THF_light_grey, size=6) +
    theme_classic(base_size=18) +
    theme(legend.position="none", axis.text.x = element_text(angle = 45, hjust=1)) + THF_theme_basic
}


# read 2018-19 data ------------------------------------------------------------------

## @knitr import-2018-19-data
IAPT_18_19 <- read_csv(here::here("Data","Raw_Annual_Data","psych-ther-ann-rep-csv-2018-19-main-csv.csv"), na = c("*", "", "NULL", "-"))

# Process England-level data ----------------------------------------------------

## @knitr select-England-level-data

England_IAPT_18_19 <- IAPT_18_19 %>% 
  filter(OrgType == "England")

# percentage who finished their treatment
England_IAPT_18_19$PercentFinishedTreatment <- (England_IAPT_18_19$CountFinishedCourseTreatment / England_IAPT_18_19$CountEndedReferrals) *100

# Process deprivation-level data  --------------------------------------------------------

## @knitr select-deprivation-data
Depriv_England_IAPT_18_19 <- England_IAPT_18_19 %>% 
  filter(VariableType == "Indices of Deprivation Decile") %>%
  filter(VariableA != "Not stated/Not known/Invalid") %>% 
  remove_empty("cols")

