--task 1
select Category, count(ProductName) a from Products
group by Category

--task 2
select Category, avg(Price) b from Products
group by Category 
having  Category= 'Electronics'

--task 3

select * from Customers
where City like 'L%'

-- task 4

select * from Products
where ProductName like '%er'

-- task 5

select * from Customers
where Country like '%A'


--task 6

Select top 1 Price from Products
order by Price desc


-- task 7

select * ,
case when StockQuantity < 30 then 'Low Stock'
else 'Sufficient' end as sm
from Products

--task 8

select Country, count(CustomerID) aa from Customers 
group by Country

--task 9
select min(Quantity) a, max(Quantity) b from Orders

-- task 10

-- Customers who placed orders in Jan 2023
SELECT DISTINCT CustomerID
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-01-31'

EXCEPT

-- Customers who have invoices for those orders
SELECT DISTINCT CustomerID
FROM Invoices
WHERE CustomerID IN (
    SELECT OrderID
    FROM Orders
    WHERE OrderDate BETWEEN '2023-01-01' AND '2023-01-31'
);

--task 11

select ProductName from Products
union all
select ProductName from Products_Discounted

--task 12

select ProductName from Products
union 
select ProductName from Products_Discounted

--task 13

select year(OrderDate) a , avg(TotalAmount)bb from Orders
group by  year(OrderDate)

--task 14

select *,
case when Price <100 then 'Low' 
when Price between 100 and 501 then 'MId'
else 'High'
end as sm

from Products 

--task 15

SELECT *
INTO Population_Each_Year
FROM (
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;


-- task 16

select ProductID, sum(SaleAmount) from Sales
group by ProductID

-- task 17

select ProductName  from Products
where ProductName like '%oo%'

--task 18
SELECT *
INTO Population_Each_City
FROM (
    SELECT Year, City, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;


--task 19

select top 3 * from Invoices
order by TotalAmount desc

--task 20

SELECT City, Year, Population
INTO City_Population
FROM (
    SELECT City, [2012], [2013]
    FROM Population_Each_Year
) AS PivotedTable
UNPIVOT (
    Population FOR Year IN ([2012], [2013])
) AS UnpivotedTable;

--task 21

select p.ProductName, count(s.ProductID) dd from Products as p
join Sales s  on p.ProductID= s.ProductID
group by p.ProductName


--task 22

SELECT Year, City, Population
INTO City_Population
FROM (
    SELECT Year, [Bektemir], [Chilonzor], [Yakkasaroy]
    FROM Population_Each_City
) AS PivotedTable
UNPIVOT (
    Population FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS UnpivotedTable;

