#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(lintr)
library(ggplot2)
library(stylr)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")
model <- readRDS(here::here("models/model.rds"))

# MAKE PLOTS 
# Distribution of ratings
ggplot(sim_data, aes(x = rating)) +
  geom_histogram(binwidth = 0.1, fill = "blue", color = "white") +
  theme_minimal() +
  labs(title = "Distribution of Ratings", x = "Rating", y = "Count")

# Distribution of pages
ggplot(sim_data, aes(x = pages)) +
  geom_histogram(binwidth = 10, fill = "green", color = "white") +
  theme_minimal() +
  labs(title = "Distribution of Pages", x = "Pages", y = "Count")

# Distribution of rating counts
ggplot(sim_data, aes(x = rating_count)) +
  geom_histogram(binwidth = 50000, fill = "purple", color = "white") +
  theme_minimal() +
  labs(title = "Distribution of Rating Counts", x = "Rating Count", y = "Count")

#### Save model ####
lint(filename = here("scripts/05-exploratory_data_analysis.R"))
style_file(path = here("scripts/05-exploratory_data_analysis.R"))