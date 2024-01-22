#### Preamble ####
# Purpose: Downloads and saves the data from Open data Toronto
# Author: Gavin Crooks
# Date: 17 January 2024 
# Contact: gavin.crooks@mail.utoronto.ca 
# Pre-requisites: N/A



#### Workspace setup ####
#Load Packages
library(opendatatoronto)
library(tidyverse)


#### Download data ####
#Download data from opendatatoronto
raw_red_light_camera_data <- list_package_resources("https://open.toronto.ca/dataset/red-light-camera-annual-charges/") %>% 
  head(1) %>% 
  get_resource()

raw_red_light_camera_data

#### Save data ####
#Save data as CSV, original data is XLSX file
write_csv(raw_red_light_camera_data, 'inputs/data/raw_red_light_camera_data.csv') 

         
