
-- task 1

select top 5 * from Employees

-- task 2 

select distinct Category from Products

-- task 3

 select * from Products
 where Price>100

 -- task4

 select * from Customers
 where FirstName like 'A%'


 --task 5

 select * from Products
 order by Price asc


 --task 6

 select * from Employees
 where Salary >= 60000 and DepartmentName = 'HR'

 --task 7

 select isnull(Email, 'noemail@example.com') as Email from Employees 

 --task 8

 select * from Products
 where Price BETWEEN 50 AND 100

 --task 9

 select distinct Category, ProductName from Products

 --task 10

  select distinct Category, ProductName from Products
  order by ProductName desc

  --task 11

  select top 10 * from Products
  order by Price desc

  --task 12

  select COALESCE(FirstName, LastName)as Name from Employees

  --task 13

  select distinct Category, Price from Products 

  --task 14

  select * from Employees
  Where  (Age  between 30 and 40 )
or  (DepartmentName = 'Marketing' )


--task 15

select * from Employees
order by salary desc
offset 10 rows
fetch next 10 rows only

-- task 16

select * from Products
where Price <= 1000 and Stock > 50
order by Stock desc

--task 17

select * from Products
where ProductName like '%e%'

--task 18

select * from Employees	
where DepartmentName in ('HR', 'IT', 'Finance')

--task 19

select * from Customers
order by City asc, PostalCode desc

--task 20

SELECT TOP(5) *
FROM Products
ORDER BY SalesAmount DESC


--task 21

select FirstName + ' '+ LastName as Fullname from Employees

-- task 22

select distinct Category, ProductName, Price from Products
where Price >50

-- task 23

SELECT *
FROM Products
WHERE Price < 0.1 * (SELECT AVG(Price) FROM Products)

--task 24

select * from Employees where Age  < 30 and  DepartmentName In ('HR' , 'IT')


--task 25

Select * from Customers
where Email like '%@gmail.com'

 -- task 26

 select * from Employees
 where Salary> All(select Salary from Employees WHERE DepartmentName = 'Sales')

 --task 27

SELECT *
FROM Orders
WHERE LATEST_DATE BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE();



 
