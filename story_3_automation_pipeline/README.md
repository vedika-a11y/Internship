



# Exploratory Data Analysis (EDA) – Online Retail Dataset

## Story 3.1 Objective

The goal of this project is to perform **Exploratory Data Analysis (EDA)** on the cleaned e-commerce dataset to understand **sales patterns, customer behavior, product performance, and business trends**.

## Dataset Overview

The dataset used is the **Online Retail dataset** after data cleaning.

**Dataset Size**

* Rows: **401,604**
* Columns: **15**

**Key Columns Used**

* quantity
* invoicedate
* unitprice
* customerid
* sales
* Sales_Rank
* revenue_per_unit
* total_sales
* year
* month
* high_value_order

## Tools and Libraries

The analysis was performed using:

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* SciPy (for statistical testing)

## Data Understanding

Initial exploration included:

* Checking dataset structure using `head()`, `shape`, and `info()`
* Generating descriptive statistics using `describe()`
* Verifying missing values across all columns

The dataset contained **no missing values after cleaning

## Visualizations Performed

Multiple visualizations were created to explore patterns in the data.

### 1. Sales Distribution (Histogram)

Shows the distribution of transaction sales values.

**Insight**

* Most orders have low sales values.
* Only a small number of transactions generate very high revenue.

### 2. Quantity Distribution (Box Plot)

Shows how many items customers purchase per order.

**Insight**

* Most purchases involve small quantities.
* Very large quantities indicate possible bulk buyers or wholesale transactions.
* Negative quantities represent product returns.

### 3. Unit Price Distribution (Histogram)

Shows how product prices are distributed.

**Insight**

* Most products are low priced.
* A few premium products have significantly higher prices.

### 4. Quantity vs Sales (Scatter Plot)

Shows the relationship between quantity purchased and total sales.

**Insight**

* Sales increase as quantity increases.
* Some negative values indicate product returns or refunds.

### 5. Correlation Matrix (Heatmap)

Shows relationships between numerical variables.

Key relationships analyzed:

* quantity
* unitprice
* sales
* revenue_per_unit
* total_sales

**Insight**

* Quantity has a strong influence on total sales.
* Unit price has relatively weaker influence.

### 6. Monthly Average Quantity Trend (Line Chart)

Analyzes how purchasing quantity changes over months.

**Insight**

* Customer purchasing behavior varies by month.

### 7. High Value Orders Distribution (Count Plot)

Shows how many transactions are high-value orders.

**Insight**

* High value orders are very rare.
* Most transactions are normal-value purchases.

### 8. Revenue per Unit Distribution (KDE Plot)

Shows density of revenue generated per product unit.

**Insight**

* Most products generate small revenue per unit.
* A small number of premium products generate high revenue.

### 9. Monthly Revenue Share (Pie Chart)

Shows how revenue is distributed across months.

**Insight**

* November generates the highest revenue.
* February and April have the lowest revenue.

## Statistical Analysis

A **Pearson correlation test** was performed to analyze the relationship between quantity and sales.

Correlation Result:

```
Correlation Coefficient: 0.916
p-value: 0.0
```

**Interpretation**

* Strong positive correlation between **quantity and sales**
* Increasing the number of items sold significantly increases revenue.

## Key Business Insights

* Revenue is primarily driven by **quantity sold rather than price per item**.
* Most transactions are **low-value purchases**, while high-value orders are rare.
* **Bulk buyers contribute significantly to revenue**.
* A small number of **premium products generate high revenue per unit**.
* **Seasonality exists in sales**, with the highest revenue occurring in the final months of the year.

## Output

The dataset used for this analysis is stored as:
cleaned_data.csv


# Story 3.3 - Automation Data Pipeline

This script automates the data processing workflow.

Pipeline Steps:
1. Load CSV dataset
2. Clean the data
3. Generate summary statistics
4. Export cleaned data to SQLite database

Usage:

python data_pipeline.py --file cleaned_data.csv --db pipeline.db

Command Line Arguments:

--file : Path to input CSV file  
--db : Database connection string

Example:

python data_pipeline.py --file cleaned_data.csv --db pipeline.db
