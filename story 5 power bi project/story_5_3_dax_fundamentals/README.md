# Story 5.3 – DAX Fundamentals

## Objective
The objective of this task was to understand DAX (Data Analysis Expressions) in Power BI by creating calculated columns and measures to perform data analysis and derive business insights.

---

## Key Concepts

### Calculated Column
- Created at row level.
- Stores values in the table.
- Used when calculation is needed for each row.

### Measure
- Dynamic calculation.
- Calculated based on filters and context.
- Used for aggregations and KPIs.

---

## Datasets Used
1. E-commerce Dataset  
2. Hotel Booking Dataset  
3. AI Job Market Dataset  

---

# 1. E-commerce Dataset

## Calculated Column

Sales Per Row  
- Formula: quantity * unitprice  
- Purpose: Calculates sales value for each transaction.

---

## Measures Created

1. Total Sales  
   - SUM(total_sales)  
   - Business Use: Overall revenue.

2. Total Quantity  
   - SUM(quantity)  
   - Business Use: Total products sold.

3. Total Orders  
   - DISTINCTCOUNT(invoiceno)  
   - Business Use: Number of orders.

4. Average Sales  
   - AVERAGE(total_sales)  
   - Business Use: Average order value.

5. Total Customers  
   - DISTINCTCOUNT(customerid)  
   - Business Use: Unique customers.

6. Sales YTD  
   - TOTALYTD([Total Sales], DateTable[Date])  
   - Business Use: Sales performance over time.

7. Previous Month Sales  
   - CALCULATE([Total Sales], DATEADD(DateTable[Date], -1, MONTH))  
   - Business Use: Compare performance with previous month.

8. Sales Performance Category  
   - IF([Total Sales] > AVERAGE(total_sales), "High", "Low")  
   - Business Use: Classify performance.

---

# 2. Hotel Booking Dataset

## Calculated Column

Revenue Per Booking  
- Formula: adr * total_nights  
- Purpose: Revenue generated per booking.

---

## Measures Created

1. Total Revenue  
   - SUM(estimated_revenue or adr based value)  
   - Business Use: Total hotel revenue.

2. Total Guests  
   - SUM(total_guests)  
   - Business Use: Total customers served.

3. Total Bookings  
   - COUNTROWS(table)  
   - Business Use: Number of bookings.

4. Average Revenue  
   - AVERAGE(adr)  
   - Business Use: Average revenue per booking.

5. Cancellation Count  
   - SUM(is_canceled)  
   - Business Use: Number of cancellations.

6. Revenue YTD  
   - TOTALYTD([Total Revenue], DateTable[Date])  
   - Business Use: Revenue trend over time.

7. Previous Month Revenue  
   - CALCULATE([Total Revenue], DATEADD(DateTable[Date], -1, MONTH))  
   - Business Use: Monthly comparison.

8. Booking Status  
   - IF([Total Bookings] > AVERAGE(total_bookings), "High Demand", "Low Demand")  
   - Business Use: Demand classification.

---

# 3. AI Job Market Dataset

## Calculated Column

Experience Category  
- Formula: 
  IF(years_experience > 5, "Senior", "Junior")  
- Purpose: Categorize candidates based on experience.

---

## Measures Created

1. Total Job Openings  
   - SUM(job_openings)  
   - Business Use: Total demand in job market.

2. Average Salary  
   - AVERAGE(salary)  
   - Business Use: Salary trend.

3. Total Job Posts  
   - COUNT(job_id)  
   - Business Use: Number of job listings.

4. Total Countries  
   - DISTINCTCOUNT(country)  
   - Business Use: Market reach.

5. Average Experience  
   - AVERAGE(years_experience)  
   - Business Use: Skill demand level.

6. Jobs YTD  
   - TOTALYTD([Total Job Openings], DateTable[Date])  
   - Business Use: Growth in job demand.

7. Previous Month Jobs  
   - CALCULATE([Total Job Openings], DATEADD(DateTable[Date], -1, MONTH))  
   - Business Use: Monthly trend comparison.

8. Hiring Demand Level  
   - IF([Total Job Openings] > AVERAGE(job_openings), "High Demand", "Low Demand")  
   - Business Use: Market demand classification.

---

## Validation

- Used card visuals to display all measures.
- Applied slicers to test dynamic filtering.
- Verified measures update correctly with filters.

---

## Learning Outcome

- Understood difference between calculated column and measure.
- Learned DAX functions like SUM, COUNT, AVERAGE.
- Applied time intelligence functions like TOTALYTD and DATEADD.
- Implemented conditional logic using IF.
- Learned how DAX helps in business decision-making.

---

## Conclusion

This task helped in understanding how DAX is used to perform calculations, create KPIs, and analyze data dynamically in Power BI across multiple datasets.