#### Preamble ####
# Purpose: Tests the number of observations and tests the model coefficient from 04-model_data.R
# Author: Hyunje Park
# Date: 29 November 2024 
# Contact: hyunje.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 04-model_data.R to get the model


#### Workspace setup ####
library(tidyverse)
library(lintr)
library(styler)
library(testthat)
model_file <- readRDS(file = here::here("models/model.rds"))

#### Test Data ####

# check the coefficients
test_that("Check summary", {
  summary_book <- summary(model_file)
  expect_true("summary.stanreg" %in% class(summary_book))})

# check that the number of observations are correct (9240)
test_that("Check number of observations is correct", {
  expect_equal(nrow(model_file$data), 9240)
})

# lint and style the code
lint(filename = here::here("scripts/06-test_observations_coefficient.R"))
style_file(path = here::here("scripts/06-test_observations_coefficient.R"))