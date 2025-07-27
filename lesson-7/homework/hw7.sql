--task 1

select min(Price) as MinP
from Products

--task 2 
select max(Salary) as MaxP
from Employees


--task 3

select count(*) as cm from Customers

--task 4

select count  (distinct Category) as cat from Products

--task 5

select sum(SaleAmount) as tp  from Sales
where ProductID= 7

--task 6

select AVG(Age) as avgage from Employees

-- task 7

	select DepartmentName, count(Age) as cemp from Employees
	group by DepartmentName

-- task 8

select category, Min(Price) as min, Max(Price) as max from Products
group by Category

-- task 9

select CustomerID, sum(SaleID) sum from Sales
group by CustomerID


--task 10

select  DepartmentName, count(EmployeeID)as c from Employees
group by DepartmentName
having sum(EmployeeID) >5

--task 11

select ProductID, sum(SaleAmount)as s, AVG(SaleAmount)as a from Sales
group by ProductID

-- task 12

select  count(EmployeeID) as a from Employees
where DepartmentName = 'HR'

-- task 13

select DepartmentName ,min(Salary) a, Max(Salary) b from Employees
group by DepartmentName


--task 14
select DepartmentName, avg(Salary)a from Employees
group by DepartmentName

-- task 15

select DepartmentName, Avg(Salary) a, Count(*) b from Employees
group by DepartmentName

--task 16

select Category, avg(Price) from Products
group by Category
Having avg(Price)>400

-- task 17

select year (SaleDate) c, sum(SaleAmount) a from Sales
group by year( SaleDate)

-- task 18

select CustomerID, count(OrderID ) a from Orders
group by CustomerID
having count(OrderID)>=3

-- task 19

select DepartmentName, Avg(Salary) a from Employees
group by DepartmentName
having avg(Salary)>60000

--task 20

select Category, avg(Price) a from Products
 group by Category
 having avg(Price) >150

 --task 21
 select CustomerID, sum(SaleAmount) from Sales
 group by CustomerID
 having sum(SaleAmount)> 1500

 --task 22
  select DepartmentName, sum(Salary) a, avg(Salary) b from Employees
  group by DepartmentName
  having avg(Salary)> 65000

  --task 23

  select CustomerID, sum(TotalAmount) a from Orders
  group by CustomerID
  having sum(TotalAmount)>50

  --task 24
  select month(OrderDate) a, year(OrderDate) b, sum(TotalAmount) c, count( distinct ProductID) d
  from Orders
  group by year(OrderDate),  month(OrderDate)
  having count( distinct ProductID) >=2

  --task 25

  select year(OrderDate) a, min(Quantity) b, max(Quantity) c from Orders
  group by year(OrderDate)


