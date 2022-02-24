
# Variation in IAPT annual data

This repo contains the scripts used for creating the figures in the medium blog ["Inequalities in English NHS talking therapy services: What can the data tell us?"](https://towardsdatascience.com/inequalities-in-english-nhs-talking-therapy-services-what-can-the-data-tell-us-4f2ba5334629?).

The scripts use the publicly available [annual IAPT data](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services) published by NHS Digital and creates graphs showing variation by Index of Multiple Deprivation (IMD) deprivation decile. 

#### Status: complete

## Contents
* [Project Description](https://github.com/HFAnalyticsLab/IAPT/blob/master/README.md#project-description)
* [Data Sources](https://github.com/HFAnalyticsLab/IAPT/blob/master/README.md#data-sources)
* [How does it work?](https://github.com/HFAnalyticsLab/IAPT#how-does-it-work)
* [Requirements](https://github.com/HFAnalyticsLab/IAPT#requirements)
* [Getting started](https://github.com/HFAnalyticsLab/IAPT#getting-started)
* [Technical Appendix](https://github.com/HFAnalyticsLab/IAPT#technical-appendix)
* [Authors](https://github.com/HFAnalyticsLab/IAPT#authors---please-feel-free-to-get-in-touch)
* [License](https://github.com/HFAnalyticsLab/IAPT#license)


## Project Description
This project examines the publicly available data on the NHS IAPT (Increasing Access to Psychological Therapies) programme. Aggregate data is made available regularly and published by NHS Digital - here we take the annual data and explore the variation in the dataset, by demographic group. 

## Data Sources
Annual public aggregate IAPT data, from NHS Digital. 

Cross-sectional code uses:   

- [2018/2019 data](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services/annual-report-2018-19) 

Longitudinal code uses:  

- [2018/2019 data](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services/annual-report-2018-19)   
- [2017/2018 data](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services/annual-report-2017---18)  
- [2016/2017 data](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services/annual-report-2016-17)  
- [2015/2016 data](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services/annual-report-2015-16)  

The format and scope of the data made available by NHS Digital changes over time. The earliest available data is from 2012/13, but we have not included earlier data releases in our analysis due to limitations in its scope. Note that depending on the year, files are sometimes provided in .zip or .rar formats and will need to be extracted. 

**Please note:** the labelling provided by NHS Digital within this dataset for IMD deprivation deciles ("01 least deprived" through to "10 most deprived") do not match the labelling used by the ONS, where the most deprived decile is labelled as decile 1, with the least deprived labelled as decile 10. 

## How does it work?

This analysis can be fully reproduced as the data for this analysis is publicly available and can be downloaded from the NHS Digital website. 
A series of graphs will be produced which show variation by IMD deprivation decile. 

Within the project directory:  
* All scripts are stored within `./R/`   
* The scripts expect data to be stored in `./Data/Raw_Annual_Data/`   
* The plots created will be saved as .pngs to `./Outputs/`    

### Requirements

These scripts are written in R (version 3.6.1 (2019-07-05) -- "Action of the Toes" was used). 
The following R packages are used (all available on CRAN):  

- [here](https://cran.r-project.org/package=here)  
- [tidyverse](https://cran.r-project.org/package=tidyverse)  
- [scales](https://cran.r-project.org/package=scales)
- [tidylog](https://cran.r-project.org/package=tidylog)
- [janitor](https://cran.r-project.org/package=janitor) 
- [readxl](https://cran.r-project.org/package=readxl) 
- [ggrepel](https://cran.r-project.org/package=ggrepel)  
 
### Getting started

1. Clone this repo (for help see this [tutorial](https://help.github.com/articles/cloning-a-repository/)).  
2. Raw data can be downloaded from [NHS Digital](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services)
3. A brief description of all scripts (contained in [R](https://github.com/HFAnalyticsLab/IAPT/tree/master/R)) is given below:

-  [00_SetUp.R](https://github.com/HFAnalyticsLab/IAPT/blob/master/R/00_SetUp.R) - loads packages, defines functions for creating graphs
-  [01_Clean_CrossSec_Depriv_Data.R](https://github.com/HFAnalyticsLab/IAPT/blob/master/R/01_Clean_CrossSec_Depriv_Data.R) - creates graphs showing variation within 2018/19 by demographic group
-  [02_Clean_Longit_Depriv_Data.R](https://github.com/HFAnalyticsLab/IAPT/blob/master/R/02_Clean_Longit_Depriv_Data.R) - creates graphs showing variation from 2015/16 - 2018/19 by demographic group
-  [03_Create_Data_Vis.R](https://github.com/HFAnalyticsLab/IAPT/blob/master/R/03_Create_Data_Vis.R) - creates plots showing variation by IMD deprivation level, both within 2018/19 and from 2015/16 - 2018/19

### Technical Appendix

This repo also contains a [Technical_Appendix](https://github.com/HFAnalyticsLab/IAPT/tree/master/Technical_Appendix) directory which a document which supported the Health Foundation response to the government’s consultation on “Advancing our health: prevention in the 2020s”. The code used to generate these plots is contained within the [R](https://github.com/HFAnalyticsLab/IAPT/tree/master/Technical_Appendix/R) subdirectory within this folder for completeness. 



## Authors - please feel free to get in touch

- Karen Hodgson, PhD - [on github](https://github.com/KarenHodgson) / [on twitter](https://twitter.com/KarenHodgePodge)

## License
This project is licensed under the [MIT License](https://github.com/HFAnalyticsLab/IAPT/blob/master/LICENSE).
