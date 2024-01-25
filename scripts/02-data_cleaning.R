#### Preamble ####
# Purpose: Cleans the raw red light camera data 
# Author: Gavin Crooks 
# Date: 17 January 2024 
# Contact: gavin.crooks@mail.utoronto.ca 
# Pre-requisites: 01-downlaod_data.R

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
#Open raw data - skip = 2 because it removes inaccurate labels
raw_data <- read_csv("inputs/data/raw_red_light_camera_data.csv", skip = 2)
head(raw_data)

# Create clean data as data frame
cleaned_data <- as.data.frame(raw_data)
# Replace NA with 0 
cleaned_data[is.na(cleaned_data)] = 0 
cleaned_data[is.na(cleaned_data)] = 0 


#Ensure all columns are in correct character class 
sapply(cleaned_data, class)
mutate(cleaned_data$"2021" <- as.numeric(cleaned_data$"2021"), warning = FALSE) 
sapply(cleaned_data,class)

#Remove remaining missing data caused by above function 
cleaned_data <- cleaned_data |> 
  drop_na()

#Rename columns to better name
names(cleaned_data)[names(cleaned_data) == 'Charges Laid by Location & Year'] <- 'Location'

#### Save data ####
write_csv(cleaned_data, "outputs/Data/analysis_data.csv")

#Renaming columns to not just a number to making working with easier

new_names <- c("Location", "year_2007","year_2008", "year_2009", "year_2010", "year_2011", "year_2012", "year_2013",
               "year_2014", "year_2015", "year_2016", "year_2017","year_2018", "year_2019", "year_2020", "year_2021",
               "year_2022")
graph_data <- cleaned_data %>% set_names(new_names)

write_csv(graph_data, "outputs/Data/graph_data.csv")

