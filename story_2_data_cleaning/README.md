# Story 2 - Python Pandas Basics & Data Cleaning

## Project Overview
This project focuses on learning and applying **Python Pandas** for real-world data analysis and data cleaning using an **ecommerce dataset**.

The work is divided into two parts:

- **Story 2.1 - Python Pandas Basics**
- **Story 2.2 - Data Cleaning Mini Project**

The dataset was loaded from CSV, explored using Pandas, cleaned, transformed, and prepared for further analysis.

## Dataset Information
- **Dataset Type:** Ecommerce transactions dataset
- **Source:** Kaggle
- **Rows before cleaning:** 541,909
- **Columns:** 8


## Objectives

### Story 2.1 - Python Pandas Basics
The objective of this part was to perform data exploration and basic analysis using Pandas.

Tasks completed:
- Loaded CSV dataset using Pandas
- Checked shape, columns, info, head, and tail
- Performed summary statistics
- Checked missing values
- Checked duplicate records
- Filtered rows using conditions
- Sorted and ranked records
- Grouped and aggregated data
- Created calculated columns
- Generated visualizations
- Derived business insights

### Story 2.2 - Data Cleaning Mini Project
The objective of this part was to convert the raw dataset into a clean and analysis-ready dataset.

Tasks completed:
- Handled missing values
- Removed duplicate rows
- Removed invalid values
- Treated outliers using IQR method
- Standardized categorical text
- Converted date column to datetime format
- Created a data quality report
- Exported cleaned dataset


## Tools and Libraries Used
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn

  Steps Performed

Imported required libraries

Loaded the ecommerce CSV dataset

Standardized column names

Converted date column to datetime

Explored dataset structure and summary

Checked missing values and duplicates

Created a new sales column

Filtered high-sales records

Sorted rows by sales

Ranked records using dense ranking

Grouped data by country and product

Created 5 calculated columns

Built visualizations

Extracted business insights

Calculated Columns Created

sales

Sales_Rank

revenue_per_unit

total_sales

year

month

high_value_order

Visualizations Created

Top 10 Countries by Total Sales

Sales Distribution Histogram

Quantity vs Sales Scatter Plot

High Value vs Normal Orders Pie Chart

Top 10 Products by Revenue

Monthly Sales Trend

Story 2.2 - Data Cleaning Mini Project
Cleaning Steps Performed

Loaded raw dataset

Checked dataset shape and structure

Measured missing values and duplicates

Dropped rows with missing CustomerID and Description

Filled numerical missing values where required

Removed duplicate rows

Identified invalid Quantity and UnitPrice values

Removed rows with:

Quantity <= 0

UnitPrice <= 0

Removed outliers using IQR method on:

Quantity

UnitPrice

Standardized text columns:

lowercasing

trimming spaces

Converted InvoiceDate to datetime

Created a data quality report

Exported cleaned dataset

Key Results
Data Exploration Results

Original dataset size: 541,909 rows

Missing values found in:

Description

CustomerID

Duplicate rows detected

Dataset included multiple countries and product categories

Sales distribution was highly skewed, with a few very large transactions

Cleaning Results

Rows before cleaning: 541,909

Rows after cleaning: 333,234

Missing values before cleaning: 136,534

Missing values after cleaning: 0

Duplicate rows before cleaning: 5,268

Duplicate rows after cleaning: 0

Data Quality Improvement

Missing values reduced by: 100%

Duplicate rows removed completely

Invalid quantity and price values removed

Outliers reduced using IQR filtering

Clean dataset exported successfully

Business Insights
Story 2.1 Insights

A small number of countries contribute the majority of sales.
Most transactions are low-value, while a few are very high-value.
Higher quantity usually leads to higher sales.
High-value orders are fewer, but contribute significantly to revenue.
A small number of products generate a large share of total sales.
Sales vary across months, showing seasonality and demand trends.

Story 2.2 Insights
The raw dataset contained a large number of missing customer IDs, showing incomplete transaction records.
Duplicate rows and invalid negative values affected data quality.
Removing bad records improved dataset reliability.
Outlier treatment made the dataset more suitable for further analysis and modeling.
Standardizing text and datetime columns improved consistency and usability



