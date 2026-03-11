# Story 2: Data Cleaning

## Objective
Transform raw dataset into an analysis-ready dataset.

## Tasks Performed
- Handled missing values using multiple strategies
- Removed duplicate records
- Detected and handled outliers using IQR method
- Standardized categorical data
- Converted date columns to datetime format
- Exported cleaned dataset to CSV

## Key Concepts Learned
- Data quality importance in analysis
- Handling missing values effectively
- Outlier detection techniques
- Data transformation and formatting

## Outcome
Produced a clean dataset ready for exploratory data analysis.

report
# Data Quality Report

## Before Cleaning
- Row Count:541909
- Missing Values:136534
- Duplicate Rows:5268
- Outliers Identified:(392692, 8)

## Cleaning Steps Applied
- Missing values handled (drop, mean/median, forward fill)
- Duplicates removed
- Outliers removed using IQR
- Categorical data standardized
- Date column converted to datetime

## After Cleaning
- Row Count:333234
- Missing Values:0
- Duplicate Rows:0
- Outliers Remaining: (333234, 8)

## Improvement Summary
- Missing values reduced by more than 100%
- Duplicate rows removed completely
- Dataset ready for analysis

