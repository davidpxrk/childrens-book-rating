#### Preamble ####
# Purpose: Models whether or not a book is high-rated based on book characteristics
# Author: Hyunje Park
# Date: November 26, 2024
# Contact: hyunje.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 02-data_cleaning.R for the parquet file

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(lintr)
library(styler)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

analysis_reduced <- analysis_data |> 
  slice_sample(n = 7000)
  
  
### Model data ####
first_model <-
  stan_glm(
    rated_high ~ cover + rating_count + publish_year + pages,
    data = analysis_data,
    family = binomial(link = 'logit'),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 529
  )


#### Save model ####
saveRDS(
  first_model,
  file = "models/model.rds"
)

# lint and style the code
lint(filename = here::here("scripts/04-model_data.R"))
style_file(path = here::here("scripts/04-model_data.R"))
