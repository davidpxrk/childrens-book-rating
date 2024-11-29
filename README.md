# Children's Book Ratings: What factors influence the likelihood of a book being high-rated?

## Overview

This repo contains the analysis of the factors that influence the likelihood of a book being high-rated using data from Alex Cookson (Cookson 2020). A Bayesion logistic regression model was used to analyze cover types, rating counts, publish year and page count on a book's rating.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Alex Cookson (Cookson 2020).
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. Parts of introduction, abstract and discussion were also written using ChatGPT. The chat history can be found in `other/llm_usage/usage.txt`.

## Reproducing the Tables and Graphs

1. Clone this repository onto your computer.
2. Clean the data running `scripts/02-data_cleaning.R`
3. Create the model using `scripts/04-model_data.R`
4. Run `paper/paper.qmd` to run the R Code for all the plots and tables.