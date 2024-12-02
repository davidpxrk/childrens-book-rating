#### Preamble ####
# Purpose: Cleans the Children's book data
# Author: Hyunje Park 
# Date: November 26, 2024
# Contact: hyunje.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(readr)
library(arrow)
library(lintr)
library(styler)

#### Clean data ####
data <- read.delim("data/raw_data/childrens-books.txt", header = TRUE, sep = "\t")
print(data)

#remove any NA value entries
data <- na.omit(data)


# make a new column that determines if a book is high rated 
data$"rated_high" <- ifelse(data$rating > 4, 1, 0)

# drop unnecessary columns 
data <- data %>% select(-c(title, publisher, author, isbn, original_publish_year))

#### Save data in parquet file, used for paper.qmd ####
write_parquet(data, "data/analysis_data/analysis_data.parquet") 

# save as csv, for test_analysis_data.R
write_csv(data, "data/analysis_data/analysis_data.csv")

# lint and style the code
lint(filename = here::here("scripts/02-data_cleaning.R"))
style_file(path = here::here("scripts/02-data_cleaning.R"))
