"""
Data cleaning module for Hotel Booking Analysis project.
"""

import pandas as pd


def load_data(file_path: str) -> pd.DataFrame:
    """
    Load dataset from a CSV file.

    Parameters:
        file_path (str): Path to the CSV file.

    Returns:
        pd.DataFrame: Loaded dataframe.
    """
    return pd.read_csv(file_path)


def fill_missing_values(df: pd.DataFrame) -> pd.DataFrame:
    """
    Fill missing values in important columns.

    Parameters:
        df (pd.DataFrame): Input dataframe.

    Returns:
        pd.DataFrame: Dataframe with missing values handled.
    """
    df = df.copy()

    df["children"] = df["children"].fillna(0)
    df["country"] = df["country"].fillna("Unknown")
    df["agent"] = df["agent"].fillna(0)
    df["company"] = df["company"].fillna(0)

    return df


def remove_duplicates(df: pd.DataFrame) -> pd.DataFrame:
    """
    Remove duplicate rows from dataframe.

    Parameters:
        df (pd.DataFrame): Input dataframe.

    Returns:
        pd.DataFrame: Dataframe without duplicates.
    """
    return df.drop_duplicates().copy()


def remove_invalid_guest_rows(df: pd.DataFrame) -> pd.DataFrame:
    """
    Remove rows where adults, children, and babies are all zero.

    Parameters:
        df (pd.DataFrame): Input dataframe.

    Returns:
        pd.DataFrame: Cleaned dataframe.
    """
    df = df.copy()
    valid_mask = ~(
        (df["adults"] == 0) &
        (df["children"] == 0) &
        (df["babies"] == 0)
    )
    return df[valid_mask].copy()


def create_arrival_date(df: pd.DataFrame) -> pd.DataFrame:
    """
    Create a proper arrival_date column from year, month, and day columns.

    Parameters:
        df (pd.DataFrame): Input dataframe.

    Returns:
        pd.DataFrame: Dataframe with arrival_date column.
    """
    df = df.copy()

    month_map = {
        "January": 1, "February": 2, "March": 3, "April": 4,
        "May": 5, "June": 6, "July": 7, "August": 8,
        "September": 9, "October": 10, "November": 11, "December": 12
    }

    df["arrival_month_num"] = df["arrival_date_month"].map(month_map)

    df["arrival_date"] = pd.to_datetime(
        dict(
            year=df["arrival_date_year"],
            month=df["arrival_month_num"],
            day=df["arrival_date_day_of_month"]
        ),
        errors="coerce"
    )

    return df


def create_features(df: pd.DataFrame) -> pd.DataFrame:
    """
    Create business-related derived features for analysis.

    Parameters:
        df (pd.DataFrame): Input dataframe.

    Returns:
        pd.DataFrame: Dataframe with engineered features.
    """
    df = df.copy()

    df["total_nights"] = df["stays_in_week_nights"] + df["stays_in_weekend_nights"]
    df["total_guests"] = df["adults"] + df["children"] + df["babies"]
    df["estimated_revenue"] = df["adr"] * df["total_nights"]
    df["is_family"] = ((df["children"] + df["babies"]) > 0).astype(int)

    def get_season(month):
        if month in ["December", "January", "February"]:
            return "Winter"
        if month in ["March", "April", "May"]:
            return "Spring"
        if month in ["June", "July", "August"]:
            return "Summer"
        return "Autumn"

    df["arrival_season"] = df["arrival_date_month"].apply(get_season)

    def lead_time_group(days):
        if days <= 30:
            return "0-30 days"
        if days <= 90:
            return "31-90 days"
        if days <= 180:
            return "91-180 days"
        return "180+ days"

    df["lead_time_group"] = df["lead_time"].apply(lead_time_group)

    return df


def clean_hotel_data(df: pd.DataFrame) -> pd.DataFrame:
    """
    Run full cleaning pipeline.

    Parameters:
        df (pd.DataFrame): Raw dataframe.

    Returns:
        pd.DataFrame: Cleaned dataframe.
    """
    df = fill_missing_values(df)
    df = remove_duplicates(df)
    df = remove_invalid_guest_rows(df)
    df = create_arrival_date(df)
    df = create_features(df)
    return df


def save_cleaned_data(df: pd.DataFrame, output_path: str) -> None:
    """
    Save cleaned dataframe to CSV.

    Parameters:
        df (pd.DataFrame): Cleaned dataframe.
        output_path (str): Output CSV path.
    """
    df.to_csv(output_path, index=False)


if __name__ == "__main__":
    raw_path = "data/raw/hotel_bookings.csv"
    output_path = "data/cleaned/cleaned_hotel_bookings.csv"

    data = load_data(raw_path)
    cleaned_data = clean_hotel_data(data)
    save_cleaned_data(cleaned_data, output_path)

    print("Cleaning completed successfully.")
    print(f"Cleaned file saved to: {output_path}")
    print(f"Final shape: {cleaned_data.shape}")