#### Preamble ####
# Purpose: Tests the cleaned Children's book data
# Author: Hyunje Park
# Date: November 29 2024
# Contact: hyunje.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 02-data_cleaning.R to get the cleaned data


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(lintr)
library(styler)

analysis_data <- read_csv(here::here("data/analysis_data/analysis_data.csv"))

#### Test data ####
# Test that the dataset has 3965 rows - dataset contains this many rows
test_that("dataset has 3965 rows", {
  expect_equal(nrow(analysis_data), 3965)
})

# Test that the dataset has 11 columns
test_that("dataset has 11 columns", {
  expect_equal(ncol(analysis_data), 11)
})

# Test that the 'cover' column is character type
test_that("'cover' is character", {
  expect_type(analysis_data$cover, "character")
})

# Test that the 'pages' column is double type
test_that("'pages' is character", {
  expect_type(analysis_data$pages, "double")
})

# Test that the 'rating' column is double type
test_that("'rating' is character", {
  expect_type(analysis_data$rating, "double")
})


# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that 'cover' contains only valid cover types
valid_cover <- c("Paperback", "Hardcover", "Board Book", "Kindle Edition", "Ebook", "Audiobook")
test_that("'cover' contains valid cover types", {
  expect_true(all(analysis_data$cover %in% valid_cover))
})
