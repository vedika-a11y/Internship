Story1.2 :Write 10 SELECT queries with WHERE, ORDER BY, LIMIT
SHOW DATABASES;
use northwind;
show tables;

#1. List 10  products with price greater than 50

SELECT productid, productName, unitPrice
FROM product
WHERE unitPrice > 50
ORDER BY unitPrice DESC;

#Identifies premium products that contribute higher revenue and profit margins, supporting pricing and sales strategy decisions.

#2. Show employees from USA

SELECT employeeId, firstname, lastname, country
FROM employee
WHERE country = 'USA'
ORDER BY lastname ASC;

#Helps analyze workforce distribution by country for regional performance evaluation and HR planning

#3. Get customers from Germany sorted by company name

SELECT custId, companyName, city
FROM customer
WHERE country = 'Germany'
ORDER BY companyname ASC;

#Supports regional customer analysis and helps organize customer data for targeted marketing in the German market.

#4. Show orders placed after 1997-01-01

SELECT orderId, orderDate, custId
FROM salesorder
WHERE orderDate > '1997-01-01'
ORDER BY orderDate ASC;

#Enables analysis of recent sales trends and business growth after a specific date

#5. List discontinued products

SELECT productId, productName, discontinued
FROM product
WHERE discontinued = 1
ORDER BY productName ASC;

#Helps track inactive inventory and supports decisions related to product lifecycle management.

#6. Get products with low stock (unitsinstock < 20)

SELECT productId, productName, unitsInStock
FROM product
WHERE unitsInStock <100
ORDER BY unitsInStock ASC;

#-Identifies products that need restocking to avoid stockouts and maintain smooth sales operations.

 #7 Show customers from London
SELECT custId, companyName, city
FROM customer
WHERE city = 'London'
ORDER BY companyName;

#Supports location-based customer analysis and regional marketing strategies.

#8. List orders with freight greater than 100

SELECT orderId, custId, freight
FROM salesorder
WHERE freight > 100
ORDER BY freight desc;

#Helps analyze high shipping costs and optimize logistics or freight pricing strategies.

#9. Show products in category 1

SELECT productId, productName, categoryId
FROM product
WHERE categoryid = 2
ORDER BY productname;

#Enables category-wise performance analysis and better product segmentation.

#10. Get order details with quantity greater than 50

SELECT orderid, productid, quantity
FROM orderdetail
WHERE quantity > 50
ORDER BY quantity DESC;

#Identifies bulk orders, helping analyze large sales transactions and wholesale customer behavior.


#2 Write 8 queries using JOINs 

(INNER, LEFT, RIGHT, FULL)
inner join
#1 Products and OrderDetails

SELECT Product.ProductName, OrderDetail.Quantity
FROM Product
INNER JOIN OrderDetail
ON Product.ProductID = OrderDetail.ProductID;

#Helps analyze which products are being sold and in what quantity, supporting sales performance and revenue analysis.

#2 Customers and salesOrder
select customer.companyname, salesorder.orderdate
from customer 
inner join salesorder
on customer.custid = salesorder.custid;

#Identifies which customers placed orders, enabling customer purchase behavior analysis and sales tracking.

#3 Products and Categories

select category.categoryid, category.categoryname, product.productname
from product 
inner join category 
on category.categoryid = product.productid;

#Supports category-wise product performance analysis and better product segmentation strategy.

#4 LEFT JOIN – Customers and orderdetail

SELECT Customer.CustID, Customer.CompanyName, salesorder.OrderID
FROM Customer
LEFT JOIN salesorder
ON Customer.CustID = salesorder.CustID;

#Shows all customers, including those who have not placed orders.
#Helps identify inactive customers and opportunities for re-engagement campaigns

#5.Products and OrderDetails

SELECT Product.ProductName, OrderDetail.OrderID
FROM Product
LEFT JOIN OrderDetail
ON Product.ProductID = OrderDetail.ProductID;

#Helps evaluate product demand trends and identify top-selling or slow-moving items.

#6 RIGHT JOIN – salesorder and Employees

SELECT Employee.EmployeeID, Employee.FirstName, salesorder.OrderID
FROM salesorder
RIGHT JOIN Employee
ON salesorder.EmployeeID = Employee.EmployeeID;

#Ensures all employees are included, even if they have not handled any sales.
 Useful for performance evaluation and workload distribution analysis.

#7 OrderDetails and Products

select orderdetail.quantity, product.unitprice
from orderdetail
right join product 
on orderdetail.orderid=product.productname;

#This join helps analyze which products are sold, in what quantity, and at what price. It supports sales performance evaluation, revenue calculation, and identification of high-demand or low-performing products.

#8 full join

SELECT Customer.CustID, salesorder.OrderID
FROM Customer
LEFT JOIN salesorder
ON Customer.CustID = salesorder.CustID

UNION

SELECT Customer.CustID, salesorder.OrderID
FROM Customer
RIGHT JOIN salesorder
ON Customer.CustID = salesorder.CustID;
Provides a complete view of all customers and all orders, including unmatched records.
 Helps identify:
Customers without orders


Orders without linked customer records (data issues)


Overall customer-sales relationship completeness


#Write 5 queries with GROUP BY and aggregate functions (COUNT, SUM, AVG, MAX, MIN count
#1.Number of Orders per Customer

SELECT CustID, COUNT(OrderID) AS TotalOrders
FROM salesorder
GROUP BY CustID;

#Helps identify loyal and high-value customers by tracking purchase frequency, supporting customer retention and loyalty strategies

#2 Total Quantity Sold per Product

SELECT Productid, SUM(Quantity) AS TotalQuantitySold
FROM OrderDetail
GROUP BY Productid;

#Shows product demand levels, helping in inventory planning, production decisions, and identifying best-selling items.

#3 AVG – Average Product Price per Category

SELECT CategoryID, AVG(UnitPrice) AS AveragePrice
FROM Product
GROUP BY CategoryID;

#Helps evaluate pricing strategy within each category and understand overall category positioning (budget vs premium).

#4 MAX – Highest Product Price in Each Category

SELECT CategoryID, MAX(UnitPrice) AS HighestPrice
FROM Product
GROUP BY CategoryID;

#Identifies premium products within each category, supporting revenue analysis and high-margin product strategy.

#5 MIN – Lowest Freight Cost per Customer

SELECT CustID, MIN(Freight) AS LowestFreight
from salesorder
GROUP BY CustID;

#Helps analyze shipping efficiency and cost optimization opportunities for different customers.


#Having clause
#1.Customers Who Placed More Than 5 Orders

SELECT CustID, COUNT(OrderID) AS TotalOrders
FROM salesorder
GROUP BY CustID
HAVING COUNT(OrderID) > 5;

#Identifies high-frequency customers, helping the company recognize loyal clients, design loyalty programs, and focus on high-value customer retention strategies.

#2.Products Sold More Than 200 Units

SELECT ProductID, SUM(Quantity) AS TotalSold
FROM OrderDetail
GROUP BY ProductID
HAVING SUM(Quantity) > 200;

#Highlights high-demand products, supporting inventory planning, production scaling, and promotional strategies for best-selling items.

#3.Categories With Average Price Greater Than 30

SELECT CategoryID, AVG(UnitPrice) AS AvgPrice
FROM Product
GROUP BY CategoryID
HAVING AVG(UnitPrice) > 30;

#Identifies premium product categories with higher overall pricing, helping the company focus on high-margin segments, optimize pricing strategies, and target customers interested in premium offerings.


#Write 5 queries with subqueries (IN, EXISTS, scalar subqueries)
#1.Customers Who Placed Orders

SELECT CustID, CompanyName
FROM Customer
WHERE CustID IN (
    select custid
    FROM salesorder
);

#Identifies active customers who have made purchases, helping measure customer engagement and sales coverage.

#2.Products That Were Ordered
SELECT ProductID, ProductName
FROM Product
WHERE ProductID IN (
    SELECT ProductID
    FROM OrderDetail);

#Shows products that generated sales, helping differentiate active products from unsold inventory.

#3.Customers Who Have Orders

SELECT CustID, CompanyName
FROM Customer c
WHERE EXISTS (
    SELECT 1
    FROM salesorder o
    WHERE o.CustID = c.CustID
);

#Efficiently identifies customers with purchase history, supporting targeted marketing and retention analysis.

#4.Scalar Subquery – Products Above Average Price

SELECT ProductID, ProductName, UnitPrice
FROM Product
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Product
);
#Highlights premium-priced products, helping evaluate high-margin offerings and pricing strategy.

#5 Orders With Maximum Freight

SELECT OrderID, Freight
FROM salesorder
WHERE Freight = (
    SELECT MAX(Freight)
    FROM salesorder
);

#Identifies the highest shipping cost orders, supporting logistics cost analysis and freight optimization.


#Story 1.3
#1. Customers who placed more than 5 orders

SELECT custID, companyName
FROM customer
WHERE custID IN (
    SELECT custID
    FROM salesorder
    GROUP BY custID
    HAVING COUNT(*) > 5
);
WITH salesorder AS (
    SELECT custID, COUNT(*) AS total_orders
    FROM salesorder
    GROUP BY custID
)
SELECT c.custID, c.companyName
FROM customer c
JOIN salesorder s
    ON c.custID = s.custID
WHERE s.total_orders > 5;
#Identifies loyal and high-value customers, supporting loyalty programs and retention strategies.

 #2: Employees with above-average birthdates

SELECT employeeID, firstname
FROM employee
WHERE birthdate > (SELECT AVG(birthdate) FROM employee);

WITH avgbirthdate AS (
    SELECT AVG(birthdate) AS avg_birthdate
    FROM employee
)
SELECT e.employeeID, e.firstName, e.birthdate
FROM employee e
JOIN avgbirthdate a
WHERE e.birthdate > a.avg_birthdate;

#Helps analyze workforce age distribution for HR planning and demographic insights.

#3: Products Costing More Than Average Price

SELECT productID, productName, unitPrice
FROM product
WHERE unitPrice > (
    SELECT AVG(unitPrice)
    FROM product
);

WITH AvgPrice AS (
    SELECT AVG(unitPrice) AS avg_price
    FROM product
)
SELECT p.productID, p.productName, p.unitPrice
FROM product p
JOIN AvgPrice a
WHERE p.unitPrice > a.avg_price;

#Highlights premium products for profitability analysis and strategic sales focus.


#Window Functions

#1 ROW_NUMBER – Latest salesorder per customer

SELECT *
FROM (
    SELECT orderID, custID, orderDate,
           ROW_NUMBER() OVER (PARTITION BY custID ORDER BY orderDate DESC) AS rn
    FROM salesorder
) t
WHERE rn = 1;

#Identifies the most recent order of each customer, helping track recent activity and engagement.

#2. DENSE_RANK – Rank products by price

SELECT productID, productName, unitPrice,
       DENSE_RANK() OVER (ORDER BY unitPrice DESC) AS price_rank
FROM product;

#Ranks products by price to identify premium and budget segments.

#3. ROW_NUMBER – Order ranking per year

SELECT orderID, YEAR(orderDate) AS order_year,
       ROW_NUMBER() OVER (PARTITION BY YEAR(orderDate)
       ORDER BY orderDate) AS yearly_order_number
FROM salesorder;

#Tracks order sequence yearly, supporting yearly performance analysis.

#4. RANK – Top selling products by total quantity

SELECT productID,
       SUM(quantity) AS total_quantity,
       RANK() OVER (ORDER BY SUM(quantity) DESC) AS sales_rank
FROM orderdetail
GROUP BY productID;

#Identifies best-selling products, supporting demand forecasting and inventory planning.

#5.Rank employees by hiredate

SELECT employeeID, firstName, hiredate,
       RANK() OVER (ORDER BY hiredate DESC) AS hire_rank
FROM employee;
Helps analyze employee seniority and workforce structure.

#3 Queries Using LAG / LEAD 

#1. Previous Order Date per Customer (LAG)
SELECT custID, orderDate,
       LAG(orderDate) OVER (PARTITION BY custID ORDER BY orderDate) AS previous_order_date
FROM salesorder;

#Analyzes customer purchase frequency and buying patterns.


#2. Difference in Order Amount Between Orders

WITH OrderTotals AS (
    SELECT orderID,
           SUM(unitPrice * quantity) AS total_amount
    FROM orderdetail
    GROUP BY orderID
)
SELECT orderID, total_amount,
       LAG(total_amount) OVER (ORDER BY orderID) AS previous_total,
       total_amount - LAG(total_amount) OVER (ORDER BY orderID) AS difference
FROM OrderTotals;

#Tracks revenue fluctuations between consecutive orders for trend analysis.

#3. Next Order Date (LEAD)

SELECT custID, orderDate,
       LEAD(orderDate) OVER (PARTITION BY custID ORDER BY orderDate) AS next_order_date
FROM salesorder;

#Helps predict customer buying cycles and future engagement timing.


#2 Queries Combining CTEs + Window Functions

#1. Top 2 products per category

WITH RankedProducts AS (
    SELECT productID, productName, categoryID, unitPrice,
           ROW_NUMBER() OVER (PARTITION BY categoryID ORDER BY unitPrice DESC) AS rn
    FROM product
)
SELECT *
FROM RankedProducts
WHERE rn <= 2;

#Identifies top-performing products within each category for focused marketing and stocking decisions.

#2. Highest Order Per Customer

WITH OrderTotals AS (
    SELECT o.orderID, o.custID,
           SUM(od.unitPrice * od.quantity) AS total_amount
    FROM salesorder o
    JOIN orderdetail od ON o.orderID = od.orderID
    GROUP BY o.orderID, o.custID
),
RankedOrders AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY custID ORDER BY total_amount DESC) AS rn
    FROM OrderTotals
)
SELECT *
FROM RankedOrders
WHERE rn = 1;

#Highlights the largest transaction per customer, helping identify high-value purchases.

5 .Recursive CTE (Organizational Hierarchy)

WITH RECURSIVE TeamHierarchy AS (

    -- Step 1: Start with the selected manager
    SELECT 
        employeeID,
        firstName,
        lastName,
      mgrid,
        1 AS level
    FROM employee
    WHERE employeeID = 2   -- Change manager ID here

    UNION ALL

    -- Step 2: Find employees who report to previous level
    SELECT 
        e.employeeID,
        e.firstName,
        e.lastName,
        e.mgrid,
        th.level + 1
    FROM employee e
    JOIN TeamHierarchy th
        ON e.mgrid = th.employeeID
)

SELECT *
FROM TeamHierarchy
ORDER BY level, employeeID;

#Displays employee-manager hierarchy, supporting organizational structure analysis, reporting clarity, and workforce planning.



