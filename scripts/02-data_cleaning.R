#### Preamble ####
# Purpose: Cleans the raw red light camera data 
# Author: Gavin Crooks 
# Date: 17 January 2024 
# Contact: gavin.crooks@mail.utoronto.ca 
# Pre-requisites: 01-downlaod_data.R

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
#Open raw data - skip = 2 because it removes inaccurate labels
raw_data <- read_csv("inputs/data/raw_red_light_camera_data.csv", skip = 2)
head(raw_data)

# Create clean data as data frame
cleaned_data <- as.data.frame(raw_data)
# Replace NA with 0 
cleaned_data[is.na(cleaned_data)] = 0 


#Remove remaining missing data 
cleaned_data <- cleaned_data |> 
  drop_na()

#Ensure all columns are in correct character class 
sapply(cleaned_data, class)
mutate(cleaned_data$"2021" <- as.numeric(cleaned_data$"2021"), warning = FALSE) 
sapply(cleaned_data,class)


#### Save data ####
write_csv(cleaned_data, "outputs/Data/analysis_data.csv")

