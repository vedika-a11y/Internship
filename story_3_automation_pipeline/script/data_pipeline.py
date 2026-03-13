import pandas as pd
import sqlite3
import argparse
import logging


# logging setup
logging.basicConfig(level=logging.INFO)


def load_data(file_path):
    logging.info("Loading dataset...")
    df = pd.read_csv(file_path)
    return df


def clean_data(df):
    logging.info("Cleaning dataset...")
    
    # remove duplicates
    df = df.drop_duplicates()

    # fill missing values
    df = df.fillna(method="ffill")

    return df


def generate_summary(df):
    logging.info("Generating summary statistics...")
    summary = df.describe()
    print(summary)


def export_to_db(df, db_path):
    logging.info("Exporting data to database...")

    conn = sqlite3.connect(db_path)

    df.to_sql("cleaned_data", conn, if_exists="replace", index=False)

    conn.close()


def main():

    parser = argparse.ArgumentParser()

    parser.add_argument("--file", required=True)
    parser.add_argument("--db", required=True)

    args = parser.parse_args()

    df = load_data(args.file)

    df = clean_data(df)

    generate_summary(df)

    export_to_db(df, args.db)

    logging.info("Pipeline completed successfully")


if __name__ == "__main__":
    main()
    
