---
output:
  html_document:
    toc: true
    keep_md: true
---

# Variation in IAPT annual data

This project takes at the [annual IAPT data](https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-annual-reports-on-the-use-of-iapt-services) published by NHS Digital and creates graphs showing variation by demographic groups. 

#### Status: Active

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
3. A brief description of all [Scripts](*Repo folder containing data processing scripts/notebooks*) is given below:

-  **00_SetUp.R** - loads packages, defines functions for creating graphs
-  **01_CrossSec_Data_Vis.R** - creates graphs showing variation within 2018/19 by demographic group
-  **02_Longit_Data_Vis.R** - creates graphs showing variation from 2015/16 - 2018/19 by demographic group

**00_SetUp.R** should be run first - order is unimportant for other scripts. 


## Authors - please feel free to get in touch

- Karen Hodgson, PhD - [on github](https://github.com/KarenHodgson) / [on twitter](https://twitter.com/KarenHodgePodge)

## License
This project is licensed under the [MIT License](https://github.com/HFAnalyticsLab/IAPT/blob/master/LICENSE).
