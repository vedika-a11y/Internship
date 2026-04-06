# Story 6 – Dashboard Design & User Thinking

#Objective

In this story, my goal was to understand how to design a **clean, professional, and user-friendly dashboard** in Power BI.
Instead of just creating visuals, I focused on **how a user will interact with the dashboard**, how easily they can understand the data, and how clearly the insights are presented.



##  Dataset Used

* **File:** hotel_bookings.db
* **Table:** hotel_bookings

This dataset contains hotel booking information such as:

* booking details
* cancellation information
* pricing (ADR)
* customer type
* market segment
* stay duration

---

##  My Approach

Before starting Power BI, I first understood:

* what important metrics I want to show
* what a user would want to see first
* how to avoid clutter

Instead of directly building visuals, I planned a **simple layout (wireframe)**:

* Top → Important numbers (KPIs)
* Middle → Trends
* Bottom → Breakdown and filters

This helped me keep the dashboard structured and easy to understand.


##  Page 1 – Overview Dashboard

This page is designed to give a **quick summary of the business**.


### 🔹 KPI Cards (Top Section)

I added 5 KPI cards because these are the most important numbers:

1. **Total Bookings**
   → Shows overall booking volume
   → Helps understand total demand

2. **Canceled Bookings**
   → Shows how many bookings were canceled
   → Important to track loss

3. **Cancellation Rate (%)**
   → Shows percentage of cancellations
   → Helps identify if cancellations are high or under control

4. **Average ADR**
   → Shows average price per booking
   → Useful for pricing analysis

5. **Repeated Guests**
   → Shows how many customers returned
   → Indicates customer loyalty

👉 I placed these at the top so that the user can immediately understand the key numbers.


### 🔹 Trend Analysis (Middle Section)

#### 1. Bookings Trend by Month

* Visual: Line chart

* What it shows:
  → How bookings change month by month

* Why I used it:
  → Line chart is best for time-based trends

* Insight it gives:
  → Helps identify peak seasons and low-demand periods


#### 2. ADR Trend by Month

* Visual: Line chart

* What it shows:
  → How pricing changes over time

* Insight it gives:
  → Helps understand if prices increase in peak season


### 🔹 Category Breakdown (Bottom Section)

#### Bookings by Market Segment

* Visual: Bar chart

* What it shows:
  → Which customer segments bring the most bookings

* Why bar chart:
  → Best for comparing categories

* Insight:
  → Helps identify which segment is most valuable



### 🔹 Filters (Right Side)

I added 2 slicers:

1. **Year filter**
   → Allows user to see data year-wise

2. **Market Segment filter**
   → Allows user to analyze specific customer groups

 These filters make the dashboard interactive and flexible.


## 📊 Page 2 – Details Dashboard

This page is for **deep analysis**.


### 🔹 Detailed Table (Matrix with Drill-down)

Hierarchy:

* Hotel → Market Segment → Customer Type

Metrics:

* Total Bookings
* Canceled Bookings
* Cancellation Rate
* Average ADR
* Average Nights


#### What this gives:

* User can drill down step by step
* Helps in understanding detailed performance
* Makes it easier to compare different groups


### 🔹 Decomposition Tree (Advanced Visual)

* Measure used: **Canceled Bookings**

Breakdown by:

* Hotel
* Market Segment
* Customer Type
* Deposit Type
* Distribution Channel


#### What this gives:

* Helps identify **why cancellations are happening**
* Shows the main contributing factors
* Useful for decision-making


## Dashboard Design Decisions

I focused a lot on design to make it look professional.



* Light background → clean look
* White cards → clear separation
* Blue → professional and consistent


### Layout decisions:

* Top = summary
* Middle = trends
* Bottom = breakdown
* Page 2 = details

 This structure makes it easy for the user to navigate.


##  Key Observations

From this dashboard, I observed:

* Some market segments contribute more bookings than others
* Cancellation rate is significant and needs attention
* Bookings follow a seasonal pattern
* Pricing (ADR) changes across months
* Repeat customers are fewer but important



##  What I Learned

* Dashboard design  it is about **user thinking**
* Too many visuals make the dashboard confusing
* Proper chart selection is very important
* Clean layout improves understanding
* Separating overview and detail makes the dashboard better




## ✅ Conclusion

This dashboard helped me understand:

* how to design dashboards for users
* how to present data clearly
* how to combine analysis with design


