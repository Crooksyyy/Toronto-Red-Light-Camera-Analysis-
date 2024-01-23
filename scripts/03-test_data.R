#### Preamble ####
# Purpose: Tests our simulated data, then test the actual data set to ensure data cleaning is done and the data set is accurate.
# Author: Gavin Crooks 
# Date: 22 January 2024 
# Contact: gavin.crooks@mail.utoronto.ca 
# Pre-requisites: 01-download_data and 02-data_cleaning



#### Workspace setup ####
library(tidyverse)
cleaned_data <- read_csv("outputs/Data/analysis_data.csv")


#### Test data ####
cleaned_data$"Charges Laid by Location & Year"|>
  unique() %>% 
  length() == 298

cleaned_data$"2007"|>
  unique()|>
  length() == 7

cleaned_data$"2022"|>
  unique()|>
  length() == 236
#Test that the lowest vlue is 0 for random years
cleaned_data$"2007" |> min() >= 0
cleaned_data$"2022" |> min() >= 0
cleaned_data$"2008" |> min() >= 0 
cleaned_data$"2009" |> min() >= 0 
cleaned_data$"2010" |> min() >= 0 
cleaned_data$"2011" |> min() >= 0 
cleaned_data$"2012" |> min() >= 0 
cleaned_data$"2013" |> min() >= 0 
cleaned_data$"2019" |> min() >= 0 
cleaned_data$"2015" |> min() >= 0 

