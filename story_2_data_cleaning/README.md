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

  # Python Pandas Data Exploration Project

## Objective

This project performs **Exploratory Data Analysis (EDA)** on an e-commerce dataset using Python.
The goal is to explore the dataset, clean missing and duplicate values, create useful features, analyze patterns, and generate business insights through visualizations.

## Dataset

* Source: Kaggle Online Retail Dataset
* Initial Size: **541,909 rows × 8 columns**
* Key Columns:

  * InvoiceNo
  * StockCode
  * Description
  * Quantity
  * InvoiceDate
  * UnitPrice
  * CustomerID
  * Country

## Data Preparation

Before analysis, the dataset was prepared using the following steps:

* Converted column names to lowercase and standardized formatting
* Converted **InvoiceDate** to datetime format
* Changed categorical columns to optimized data types
* Removed rows with missing values
* Removed duplicate records
* Created a **Sales column** using:


sales = quantity × unitprice

## Data Exploration

Basic exploration steps included:

* Checking dataset structure using `info()` and `describe()`
* Identifying missing values
* Detecting duplicate rows
* Exploring distributions and statistical summaries
* Understanding customer purchasing patterns

## Feature Engineering

Several new columns were created to improve analysis:

* **sales** – total revenue per transaction
* **Sales_Rank** – ranking transactions by sales value
* **revenue_per_unit** – price per item
* **total_sales** – calculated revenue
* **year** – extracted from InvoiceDate
* **month** – extracted from InvoiceDate
* **high_value_order** – flag for orders above a threshold

These features helped analyze trends and business performance.

## Data Analysis Techniques

The project demonstrates pandas operations similar to SQL:

* **Filtering** → equivalent to SQL `WHERE`
* **Sorting and Ranking** → equivalent to SQL `ORDER BY`
* **Grouping and Aggregation** → equivalent to SQL `GROUP BY`

Examples include:

* Total sales by country
* Top-selling products
* High-value orders

### Visualizations Created

1. **Top 10 Countries by Total Sales** (Bar Chart)
2. **Sales Distribution** (Histogram)
3. **Quantity vs Sales Relationship** (Scatter Plot)
4. **High Value vs Normal Orders Distribution** (Pie Chart)
5. **Top 10 Products by Revenue** (Bar Chart)
6. **Monthly Sales Trend** (Line Graph)

These visualizations help identify sales patterns, product performance, and customer behavior.

## Key Business Insights

* A small number of countries generate the majority of total sales.
* Most transactions involve small purchase amounts, with a few high-value orders driving revenue.
* Higher quantities purchased typically lead to higher total sales.
* Certain products contribute significantly more revenue than others.
* Sales trends vary across months, indicating seasonal demand patterns.

## Tools Used

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook

## Output

The processed dataset was exported as:

`cleaned_data.csv`


