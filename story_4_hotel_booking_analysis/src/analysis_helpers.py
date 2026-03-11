"""
Helper functions for analysis and summary tables.
"""

import pandas as pd


def cancellation_rate_by_hotel(df: pd.DataFrame) -> pd.DataFrame:
    """
    Calculate cancellation rate by hotel type.
    """
    summary = (
        df.groupby("hotel")
        .agg(
            total_bookings=("hotel", "count"),
            cancellations=("is_canceled", "sum")
        )
        .reset_index()
    )
    summary["cancellation_rate_pct"] = (
        summary["cancellations"] / summary["total_bookings"] * 100
    ).round(2)

    return summary


def monthly_revenue_summary(df: pd.DataFrame) -> pd.DataFrame:
    """
    Calculate monthly bookings and estimated revenue.
    """
    summary = (
        df.groupby(["arrival_date_year", "arrival_date_month"])
        .agg(
            total_bookings=("hotel", "count"),
            avg_adr=("adr", "mean"),
            estimated_revenue=("estimated_revenue", "sum")
        )
        .reset_index()
    )
    summary["avg_adr"] = summary["avg_adr"].round(2)
    summary["estimated_revenue"] = summary["estimated_revenue"].round(2)

    return summary


def segment_summary(df: pd.DataFrame) -> pd.DataFrame:
    """
    Summarize market segment performance.
    """
    summary = (
        df.groupby("market_segment")
        .agg(
            total_bookings=("market_segment", "count"),
            avg_adr=("adr", "mean"),
            estimated_revenue=("estimated_revenue", "sum"),
            cancellations=("is_canceled", "sum")
        )
        .reset_index()
    )

    summary["cancellation_rate_pct"] = (
        summary["cancellations"] / summary["total_bookings"] * 100
    ).round(2)
    summary["avg_adr"] = summary["avg_adr"].round(2)
    summary["estimated_revenue"] = summary["estimated_revenue"].round(2)

    return summary.sort_values("estimated_revenue", ascending=False)