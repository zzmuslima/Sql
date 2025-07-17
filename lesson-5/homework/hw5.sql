--Task 1

SELECT ProductName AS Name
FROM Products

--Task 2

SELECT *
FROM Customers AS Client

-- task 3

Select ProductName from Products
union
Select ProductName from Products_Discounted

--Task 4

SELECT ProductName
FROM Products

INTERSECT

SELECT ProductName
FROM Products_Discounted

--task 5

select distinct CustumerName, Country from Custumer

-- Task 6

Select ProductName, Price 

case when Price >1000 then 'High'
else 'Low' end as PriceCat

from Products

--Task 7

Select StockQuantity 
IIF (StockQuantity > 100, 'YES', 'NO') as InStock
From Products_Discounted

-- Task 8

Select ProductName from Products
union
Select ProductName from Products_Discounted


--Task 9
SELECT ProductName
FROM Products

Except

SELECT ProductName
FROM Products_Discounted


--task 10

Select Price
IIF (Price >1000, 'Expensive', 'Affordable') as PriceCateg
From Products

-- Task 11

SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000

-- Task 12
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'HR' OR EmployeeID = 5;

-- task 13
 Select SaleAmount
 case when SaleAmount > 500 then 'Top Tier'
 when SaleAmount BETWEEN 200 AND 500 then 'Mid Tier'
 else 'Low Tier' end as SaleTier

 from Sales

 --task 14

 select CustumerID
 from Orders

 except 

SELECT CustomerID
FROM Sales

--task 15

SELECT 
  CustomerID,
  Quantity,
  CASE 
    WHEN Quantity = 1 THEN '3%'
    WHEN Quantity > 1 AND Quantity <= 3 THEN '5%'
    ELSE '7%'
  END AS DiscountPercentage
FROM Orders
