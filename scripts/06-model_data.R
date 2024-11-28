#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Hyunje Park
# Date: November 26, 2024
# Contact: hyunje.park@mail.utoronto.ca
# License: MIT
# Pre-requisites:


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

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


