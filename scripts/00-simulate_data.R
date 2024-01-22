#### Preamble ####
# Purpose: Simulate Toronto red light camera data to be able to test the actual data set
# Author: Gavin Crooks
# Date: 22 January 2024
# Contact: gavin.crooks@mail.utoronto.ca



#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(data.table)

#### Simulate data ####
# Always set seed 
set.seed(93)

#Creating a table with 100 different roads or 100 red light cameras
sample_data = data.table(road = 1:100)
# For each red light camera using any distribution pick the number of tickets issued by year
sample_data = sample_data[, as.list(round(rnorm(13,100,10))), by = road]

###Save data###
write_csv(sample_data, "outputs/data/simulated_data.csv")




