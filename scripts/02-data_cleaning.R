#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Gavin Crooks [...UPDATE THIS...]
# Date: 17 January 2024 [...UPDATE THIS...]
# Contact: gavin.crooks@mail.utoronto.ca [...UPDATE THIS...]
# Pre-requisites: 01-downlaod_data.R

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_red_light_camera_data.csv")


raw_data <- raw_data[-1,]
raw_data
raw
cleaned_data <- raw_data %>% replace(is.na(.), 0)
cleaned_data

cleaned_data <- cleaned_data %>% 
  drop_na()

cleaned_data 

head(cleaned_data)

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(wing_width_mm, wing_length_mm, flying_time_sec_first_timer) |>
  filter(wing_width_mm != "caw") |>
  mutate(
    flying_time_sec_first_timer = if_else(flying_time_sec_first_timer == "1,35",
                                   "1.35",
                                   flying_time_sec_first_timer)
  ) |>
  mutate(wing_width_mm = if_else(wing_width_mm == "490",
                                 "49",
                                 wing_width_mm)) |>
  mutate(wing_width_mm = if_else(wing_width_mm == "6",
                                 "60",
                                 wing_width_mm)) |>
  mutate(
    wing_width_mm = as.numeric(wing_width_mm),
    wing_length_mm = as.numeric(wing_length_mm),
    flying_time_sec_first_timer = as.numeric(flying_time_sec_first_timer)
  ) |>
  rename(flying_time = flying_time_sec_first_timer,
         width = wing_width_mm,
         length = wing_length_mm
         ) |> 
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
