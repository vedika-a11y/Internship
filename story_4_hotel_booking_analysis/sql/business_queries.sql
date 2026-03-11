-- =========================================================
-- HOTEL BOOKING ANALYSIS - BUSINESS SQL QUERIES
-- =========================================================

-- Question 1:
-- Which hotel type has a higher cancellation rate?

SELECT
    hotel,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM hotel_bookings
GROUP BY hotel;


-- Question 2:
-- How does lead time influence cancellation probability?

SELECT
    CASE
        WHEN lead_time <= 30 THEN '0-30 days'
        WHEN lead_time <= 90 THEN '31-90 days'
        WHEN lead_time <= 180 THEN '91-180 days'
        ELSE '180+ days'
    END AS lead_time_group,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM hotel_bookings
GROUP BY lead_time_group
ORDER BY cancellation_rate_pct DESC;


-- Question 3:
-- Which months and years have the highest demand and revenue potential?

SELECT
    arrival_date_year,
    arrival_date_month,
    COUNT(*) AS total_bookings,
    ROUND(AVG(adr), 2) AS avg_adr,
    ROUND(SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)), 2) AS estimated_revenue
FROM hotel_bookings
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year, total_bookings DESC;


-- Question 4:
-- Which market segments contribute most bookings and revenue?

SELECT
    market_segment,
    COUNT(*) AS total_bookings,
    ROUND(AVG(adr), 2) AS avg_adr,
    ROUND(SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)), 2) AS estimated_revenue,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM hotel_bookings
GROUP BY market_segment
ORDER BY estimated_revenue DESC;


-- Question 5:
-- Which booking distribution channels bring the most stable bookings?

SELECT
    distribution_channel,
    COUNT(*) AS total_bookings,
    ROUND(AVG(adr), 2) AS avg_adr,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM hotel_bookings
GROUP BY distribution_channel
ORDER BY total_bookings DESC;