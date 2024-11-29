#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
library(lintr)
library(styler)

set.seed(529)

#### Simulate data ####
n <- 4000
sim_data <- data.frame(
  cover = sample(c("Paperback", "Hardcover"), n, replace = TRUE, prob = c(0.6, 0.4)),
  pages = sample(50:500, n, replace = TRUE),
  publish_year = sample(1950:2020, n, replace = TRUE),
  rating = round(runif(n, 1, 5), 2),
  rating_count = sample(100:1000000, n, replace = TRUE),
  rating_5 = sample(10:500000, n, replace = TRUE),
  rating_4 = sample(10:300000, n, replace = TRUE),
  rating_3 = sample(10:200000, n, replace = TRUE),
  rating_2 = sample(10:100000, n, replace = TRUE),
  rating_1 = sample(10:50000, n, replace = TRUE)
)

# Tests and Validation
# 1. Check data types and structure
str(sim_data)

# 2. Summarize the dataset to check ranges and distributions
summary(sim_data)

# 3. Verify relationships between variables
# Check that rating components add up
sim_data <- sim_data %>%
  mutate(total_ratings = rating_5 + rating_4 + rating_3 + rating_2 + rating_1)

if (all(sim_data$total_ratings == sim_data$rating_count)) {
  print("Rating components correctly sum to rating_count.")
} else {
  print("Discrepancy found in rating components.")
}

# 4. Check cover proportions
cover_proportions <- table(sim_data$cover) / nrow(sim_data)
print("Cover Proportions:")
print(cover_proportions)


#### lint and style the code nicely ####
lint(filename = here('scripts/00-simulate_data.R'))
style_file(path = here("scripts/00-simulate_data.R"))
