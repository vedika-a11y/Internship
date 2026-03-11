show tables;

#task1:Write 10 SELECT queries with WHERE, ORDER BY, LIMIT
SHOW DATABASES;
#1. List all products with price greater than 50
use northwind;
SHOW TABLES;
select*from product;
SELECT productid, productName, unitPrice
FROM product
WHERE unitPrice > 50
ORDER BY unitPrice DESC
LIMIT 10;

#2. Show employees from USA
SELECT employeeId, firstname, lastname, country
FROM employee
WHERE country = 'USA'
ORDER BY lastname ASC
LIMIT 5;

#3. Get customers from Germany sorted by company name
SELECT custId, companyName, city
FROM customer
WHERE country = 'Germany'
ORDER BY companyname ASC
LIMIT 10;

#4. Show orders placed after 1997-01-01
SELECT orderId, productId, orderDetailId
FROM orderdetail-
WHERE unitPrice > 200
ORDER BY unitPrice DESC
LIMIT 15;

#5. List discontinued products
SELECT productId, productName, discontinued
FROM product
WHERE discontinued = 1
ORDER BY productName ASC
LIMIT 10;

#6. Get products with low stock (unitsinstock < 20)
SELECT productId, productName, unitsInStock
FROM product
WHERE unitsInStock < 20
ORDER BY unitsInStock ASC
LIMIT 10;

#7. Show customers from London
SELECT custId, companyName, city
FROM customer
WHERE city = 'London'
ORDER BY companyName
LIMIT 10;

#8. List orders with freight greater than 100
SELECT orderId, custId, freight
FROM salesorder
WHERE freight > 100
ORDER BY freight DESC
LIMIT 10;

#9. Show products in category 1
SELECT productId, productName, categoryId
FROM product
WHERE categoryid = 1
ORDER BY productname
LIMIT 10;
#10. Get order details with quantity greater than 50
SELECT orderid, productid, quantity
FROM orderdetail
WHERE quantity > 50
ORDER BY quantity DESC
LIMIT 10;

#2 Write 8 queries using JOINs (INNER, LEFT, RIGHT, FULL)
#inner join
#1 Products and OrderDetails
SELECT Product.ProductName, OrderDetail.Quantity
FROM Product
INNER JOIN OrderDetail
ON Product.ProductID = OrderDetail.ProductID;

#2 Customers and salesOrder
select customer.companyname, salesorder.orderdate
from customer 
inner join salesorder
on customer.custid = salesorder.custid;


#3 Products and Categories
select category.categoryid, category.categoryname, product.productname
from product 
inner join category 
on category.categoryid = product.productid;


#4 LEFT JOIN – Customers and orderdetails
SELECT Customer.CustID, Customer.CompanyName, salesorder.OrderID
FROM Customer
LEFT JOIN salesorder
ON Customer.CustID = salesorder.CustID;

#5Products and OrderDetails
SELECT Product.ProductName, OrderDetail.OrderID
FROM Product
LEFT JOIN OrderDetail
ON Product.ProductID = OrderDetail.ProductID;

#6 RIGHT JOIN – salesorder and Employees
SELECT Employee.EmployeeID, Employee.FirstName, salesorder.OrderID
FROM salesorder
RIGHT JOIN Employee
ON salesorder.EmployeeID = Employee.EmployeeID;

#7 OrderDetails and Products
select orderdetail.quantity, product.unitprice
from orderdetail
right join product 
on orderdetail.orderid=product.productname;

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

#Write 5 queries with GROUP BY and aggregate functions (COUNT, SUM, AVG, MAX, MIN
#count
#1Number of Orders per Customer
SELECT CustID, COUNT(OrderID) AS TotalOrders
FROM salesorder
GROUP BY CustID;

#2Total Quantity Sold per Product
SELECT Productid, SUM(Quantity) AS TotalQuantitySold
FROM OrderDetail
GROUP BY Productid;

#3AVG – Average Product Price per Category
SELECT CategoryID, AVG(UnitPrice) AS AveragePrice
FROM Product
GROUP BY CategoryID;

#4MAX – Highest Product Price in Each Category

SELECT CategoryID, MAX(UnitPrice) AS HighestPrice
FROM Product
GROUP BY CategoryID;

#5MIN – Lowest Freight Cost per Customer
SELECT CustID, MIN(Freight) AS LowestFreight
from salesorder
GROUP BY CustID;

#having clause
#1Customers Who Placed More Than 5 Orders
SELECT CustID, COUNT(OrderID) AS TotalOrders
FROM salesorder
GROUP BY CustID
HAVING COUNT(OrderID) > 5;

#2Products Sold More Than 200 Units

SELECT ProductID, SUM(Quantity) AS TotalSold
FROM OrderDetail
GROUP BY ProductID
HAVING SUM(Quantity) > 200;

#3Categories With Average Price Greater Than 30
SELECT CategoryID, AVG(UnitPrice) AS AvgPrice
FROM Product
GROUP BY CategoryID
HAVING AVG(UnitPrice) > 30;

#Write 5 queries with subqueries (IN, EXISTS, scalar subqueries)
#1Customers Who Placed Orders
SELECT CustID, CompanyName
FROM Customer
WHERE CustID IN (
    select custid
    FROM salesorder
);

#2Products That Were Ordered
SELECT ProductID, ProductName
FROM Product
WHERE ProductID IN (
    SELECT ProductID
    FROM OrderDetail
);

#3Customers Who Have Orders
SELECT CustID, CompanyName
FROM Customer c
WHERE EXISTS (
    SELECT 1
    FROM salesorder o
    WHERE o.CustID = c.CustID
);


#4Scalar Subquery – Products Above Average Price

SELECT ProductID, ProductName, UnitPrice
FROM Product
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Product
);

#5 Orders With Maximum Freight

SELECT OrderID, Freight
FROM salesorder
WHERE Freight = (
    SELECT MAX(Freight)
    FROM salesorder
);

#story 1.3
Query 1: Customers who placed more than 5 orders

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


Query 2: Employees with above-average birthdates
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

#Query 3: Products Costing More Than Average Price

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

Window Functions

#1 ROW_NUMBER – Latest salesorder per customer
SELECT *
FROM (
    SELECT orderID, custID, orderDate,
           ROW_NUMBER() OVER (PARTITION BY custID ORDER BY orderDate DESC) AS rn
    FROM salesorder
) t
WHERE rn = 1;

#2. DENSE_RANK – Rank products by price
SELECT productID, productName, unitPrice,
       DENSE_RANK() OVER (ORDER BY unitPrice DESC) AS price_rank
FROM product;

🔹#3. ROW_NUMBER – Order ranking per year
SELECT orderID, YEAR(orderDate) AS order_year,
       ROW_NUMBER() OVER (PARTITION BY YEAR(orderDate)
       ORDER BY orderDate) AS yearly_order_number
FROM salesorder;


#4. RANK – Top selling products by total quantity
SELECT productID,
       SUM(quantity) AS total_quantity,
       RANK() OVER (ORDER BY SUM(quantity) DESC) AS sales_rank
FROM orderdetail
GROUP BY productID;

#5Rank employees by hiredate
SELECT employeeID, firstName, hiredate,
       RANK() OVER (ORDER BY hiredate DESC) AS hire_rank
FROM employee;

3 Queries Using LAG / LEAD (Time-Series)
1. Previous Order Date per Customer (LAG)
SELECT custID, orderDate,
       LAG(orderDate) OVER (PARTITION BY custID ORDER BY orderDate) AS previous_order_date
FROM salesorder;


2. Difference in Order Amount Between Orders

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

3. Next Order Date (LEAD)

SELECT custID, orderDate,
       LEAD(orderDate) OVER (PARTITION BY custID ORDER BY orderDate) AS next_order_date
FROM salesorder;

2 Queries Combining CTEs + Window Functions

1. Top 2 products per category

WITH RankedProducts AS (
    SELECT productID, productName, categoryID, unitPrice,
           ROW_NUMBER() OVER (PARTITION BY categoryID ORDER BY unitPrice DESC) AS rn
    FROM product
)
SELECT *
FROM RankedProducts
WHERE rn <= 2;

2. Highest Order Per Customer

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

#5Recursive CTE (Organizational Hierarchy)

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


