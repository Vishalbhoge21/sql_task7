USE ELEVATE ;
SELECT * FROM Customers;
SELECT * FROM Orders;

CREATE VIEW view_all_customers AS
SELECT CustomerID, CustomerName, City
FROM Customers;

SELECT * FROM view_all_customers;

CREATE VIEW view_customer_orders AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.OrderDate,
    o.Amount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT * FROM view_customer_orders;

CREATE VIEW view_total_spend AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    SUM(o.Amount) AS TotalSpent,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

SELECT * FROM view_total_spend;

CREATE VIEW view_high_value_customers AS
SELECT *
FROM view_total_spend
WHERE TotalSpent > 2000;

SELECT * FROM view_high_value_customers;

CREATE VIEW view_customer_city AS
SELECT CustomerID, CustomerName, City
FROM Customers;

UPDATE view_customer_city
SET City = 'Bangalore'
WHERE CustomerID = 4;

DROP VIEW IF EXISTS view_high_value_customers;

CREATE VIEW view_pune_customers AS
SELECT * FROM Customers
WHERE City = 'Pune'
WITH CHECK OPTION;

