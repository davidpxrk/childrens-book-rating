#### Preamble ####
# Purpose: Replicated graphs from... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
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