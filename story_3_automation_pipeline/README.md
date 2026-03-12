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
