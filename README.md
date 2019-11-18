
# Variation in IAPT annual data

This project takes the [annual IAPT data](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services) published by NHS Digital and creates graphs showing variation by demographic groups. 

#### Status: In Progress

## Contents
* [Project Description](https://github.com/HFAnalyticsLab/IAPT/blob/master/README.md#project-description)
* [Data Sources](https://github.com/HFAnalyticsLab/IAPT/blob/master/README.md#data-sources)
* [How does it work?](https://github.com/HFAnalyticsLab/IAPT#how-does-it-work)
* [Requirements](https://github.com/HFAnalyticsLab/IAPT#requirements)
* [Getting started](https://github.com/HFAnalyticsLab/IAPT#getting-started)
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

## How does it work?

This analysis can be fully reproduced as the data for this analysis is publicly available and can be downloaded from the NHS Digital website. 
A series of graphs will be produced which show variation by demographic group. 

### Requirements

These scripts are written in R (version 3.6.1 (2019-07-05) -- "Action of the Toes" was used). 
The following R packages are used (all available on CRAN):  

- [here](https://cran.r-project.org/package=here)  
- [knitr](https://cran.r-project.org/package=knitr)  
- [readxl](https://cran.r-project.org/package=readxl)  
- [tidyverse](https://cran.r-project.org/package=tidyverse)  
- [janitor](https://cran.r-project.org/package=janitor)  
- [scales](https://cran.r-project.org/package=scales)  
- [cowplot](https://cran.r-project.org/package=cowplot)  
- [magrittr](https://cran.r-project.org/package=magrittr)  
- [tidylog](https://cran.r-project.org/package=tidylog)  



### Getting started

1. Clone this repo (for help see this [tutorial](https://help.github.com/articles/cloning-a-repository/)).  
2. Raw data can be downloaded from [NHS Digital](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services)
3. A brief description of all scripts (contained in [R](https://github.com/HFAnalyticsLab/IAPT/tree/master/R)) is given below:

-  **00_SetUp.R** - loads packages, defines functions for creating graphs
-  **01_CrossSec_Data_Vis.R** - creates graphs showing variation within 2018/19 by demographic group
-  **02_Longit_Data_Vis.R** - creates graphs showing variation from 2015/16 - 2018/19 by demographic group

**00_SetUp.R** should be run first - order is unimportant for other scripts. 

### Technical Appendix

This repo also contains a [Technical_Appendix](https://github.com/HFAnalyticsLab/IAPT/tree/master/Technical_Appendix) directory which a document which supported the Health Foundation response to the government’s consultation on “Advancing our health: prevention in the 2020s”. The code used to generate these plots is contained within the [R](https://github.com/HFAnalyticsLab/IAPT/tree/master/Technical_Appendix/R) subdirectory within this folder for completeness. 



## Authors - please feel free to get in touch

- Karen Hodgson, PhD - [on github](https://github.com/KarenHodgson) / [on twitter](https://twitter.com/KarenHodgePodge)

## License
This project is licensed under the [MIT License](https://github.com/HFAnalyticsLab/IAPT/blob/master/LICENSE).
