# Story 5.2 – Basic Data Modeling

## Objective
The objective of this task was to understand basic data modeling concepts in Power BI by identifying fact and dimension tables, creating relationships, and defining key business KPIs.

---

## Datasets Used
1. E-commerce Dataset  
2. Hotel Booking Dataset  
3. AI Job Market Dataset  

---

# 1. E-commerce Dataset

## Main Table (Fact Table)
- cleaned_data

## Dimension Columns
- Date: invoicedate, year, month
- Product: description, stockcode
- Customer: customerid
- Region: country

## Relationships
- Created DateTable
- Linked DateTable[Date] → cleaned_data[invoicedate]
- Cardinality: One-to-Many
- Cross filter: Single direction

## KPIs Defined

1. Total Sales  
   - SUM(total_sales)  
   - Business Question: What is total revenue generated?

2. Average Sales  
   - AVERAGE(total_sales)  
   - Business Question: What is average order value?

3. Total Orders  
   - DISTINCTCOUNT(invoiceno)  
   - Business Question: How many orders were placed?

4. Growth %  
   - Based on time comparison using DateTable  
   - Business Question: Is sales increasing over time?

5. Top Category  
   - Based on highest sales by product/category  
   - Business Question: Which product/category generates highest revenue?

## Business Insights
- Identifies top-performing countries and products  
- Helps track revenue growth  
- Supports customer and order analysis  

---

# 2. Hotel Booking Dataset

## Main Table (Fact Table)
- cleaned_hotel_bookings

## Dimension Columns
- Date: arrival_date (year, month, day)
- Customer: customer_type
- Region: country
- Hotel Type: hotel
- Distribution: market_segment, distribution_channel

## Relationships
- Created DateTable
- Linked DateTable[Date] → cleaned_hotel_bookings[arrival_date]
- Cardinality: One-to-Many
- Cross filter: Single direction

## KPIs Defined

1. Total Revenue  
   - SUM(estimated_revenue or adr)  
   - Business Question: What is total revenue generated from bookings?

2. Average Revenue  
   - AVERAGE(adr)  
   - Business Question: What is average revenue per booking?

3. Total Bookings  
   - COUNT of records  
   - Business Question: How many bookings were made?

4. Growth %  
   - Based on time comparison  
   - Business Question: Are bookings increasing over time?

5. Top Segment  
   - Based on highest bookings or revenue  
   - Business Question: Which customer segment contributes most?

## Business Insights
- Identifies peak booking periods  
- Helps understand customer segments  
- Supports pricing and occupancy decisions  

---

# 3. AI Job Market Dataset

## Main Table (Fact Table)
- AI Job Market Dataset

## Dimension Columns
- Time: job_posting_year, job_posting_month
- Role: job_title
- Company: company_size, company_industry
- Location: country
- Candidate Profile: education_level, experience_level
- Work Type: remote_type

## Relationships
- Created DateTable
- Linked DateTable[Date] → job_posting_year/month (or combined date)
- Cardinality: One-to-Many
- Cross filter: Single direction

## KPIs Defined

1. Total Jobs  
   - SUM(job_openings)  
   - Business Question: How many job openings are available?

2. Average Salary  
   - AVERAGE(salary)  
   - Business Question: What is the average salary offered?

3. Total Job Posts  
   - COUNT(job_id)  
   - Business Question: How many job postings exist?

4. Growth %  
   - Based on job postings over time  
   - Business Question: Is job demand increasing?

5. Top Job Role  
   - Based on highest job openings  
   - Business Question: Which role is most in demand?

## Business Insights
- Identifies high-demand job roles  
- Helps understand salary trends  
- Supports career and hiring strategy decisions  

---

## Overall Outcome

- Understood how to structure data into fact and dimension tables  
- Created relationships using DateTable  
- Defined KPIs aligned with business questions  
- Applied modeling concepts across multiple datasets  

---

## Conclusion

This task helped in understanding how raw data is structured into meaningful models and how KPIs are defined to answer real-world business questions using Power BI.