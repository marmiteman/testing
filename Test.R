# Version of R - 3.6.1
#
# Description - Create long delays excel tables
#########################################################################


### 0 - Load setup environment ----

source(here::here("code", "00_setup-environment.R"))


### 1 - Read in trend file ----

trend <-
  read_rds(
    here("trend", 
         paste0(format(start_month, "%Y-%m"), "_trend.rds"))
  ) %>%
  
  # Remove Code 100's and select only census records, keep data from July 2016
  filter(delay_reason_1 != 100 & census_flag=='1' & month=="Jan 2023") %>% 
  filter(delay_at_census>364 & delay_reason_1!="9")
