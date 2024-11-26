#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(readr)
library(arrow)

#### Clean data ####
data <- read.delim("data/01-raw_data/childrens-books.txt", header = TRUE, sep = "\t")
print(data)

# make a new column that determines if a book is high rated 
data$"rated_high" <- ifelse(data$rating > 4, 1, 0)

# drop unnecessary columns 
data <- data %>% select(-c(isbn, original_publish_year))

#### Save data in parquet file ####
write_parquet(data, "data/02-analysis_data/analysis_data.parquet") 
