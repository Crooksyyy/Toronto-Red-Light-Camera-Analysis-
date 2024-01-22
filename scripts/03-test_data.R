#### Preamble ####
# Purpose: Tests our simulated data, then test the actual data set to ensure data cleaning is done and the data set is accurate.
# Author: Gavin Crooks 
# Date: 22 January 2024 
# Contact: gavin.crooks@mail.utoronto.ca [...UPDATE THIS...]
# Pre-requisites: 01-download_data and 02-data_cleaning



#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]
cleane
#### Test data ####
# All locations in cleaned data
cleaned_data$`Charges Laid by Location & Year`|>
  unique()|>
  length() == 306

cleaned_data$"2007"|>
  unique()|>
  length() == 306


