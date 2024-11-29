#### Preamble ####
# Purpose: Explores and understands the dataset and model by creating visualizations
# Author: Hyunje Park
# Date: 29 November 2024
# Contact: hyunje.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 02-data_cleaning.R and 04-model_data.R 

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