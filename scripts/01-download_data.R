#### Preamble ####
# Purpose: Downloads and saves the data from Open data toronto
# Author: Gavin Crooks
# Date: 17 January 2024 
# Contact: gavin.crooks@mail.utoronto.ca 
# Pre-requisites: N/A



#### Workspace setup ####
#Load Packages
library(opendatatoronto)
library(tidyverse)


#### Download data ####
red_light_camera_annual_charges <- search_packages("red_light_camera_annual_charges")
red_light_camera_annual_charges

raw_red_light_camera_data <- list_package_resources("https://open.toronto.ca/dataset/red-light-camera-annual-charges/") %>% 
  head(1) %>% 
  get_resource()

raw_red_light_camera_data

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
