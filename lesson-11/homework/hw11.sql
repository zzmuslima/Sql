-- task 1

select o.OrderID, c.FirstName+' '+ c.LastName CustomerName, o.OrderDate from Orders o
join Customers c on o.CustomerID=c.CustomerID and year(o.OrderDate)> '2022'



-- task 2

select e.Name EmployeeName, d.DepartmentName from Employees e
 join Departments d on e.DepartmentID=d.DepartmentID and (d.DepartmentName= 'Sales' 
or d.DepartmentName='Marketing')

-- task 3

select d.DepartmentName, max(e.Salary) MaxSalary from Departments d
join Employees e on d.DepartmentID=e.DepartmentID 
group by d.DepartmentName


--task 4


select c.FirstName+' '+ c.LastName CustomerName, o.OrderID, o.OrderDate from Customers c
join Orders o on c.CustomerID=o.CustomerID and c.Country= 'USA' and  year (o.OrderDate)= '2023'

--task 5 

select c.FirstName+' '+ c.LastName as CustomerName, count(o.OrderID) as TotalOrders from Orders o
join Customers c on o.CustomerID=c.CustomerID 
group by c.FirstName+' '+ c.LastName 

--task 6

select  p.ProductName, s.SupplierName from Products p
join Suppliers s on p.SupplierID=s.SupplierID and s.SupplierName in('Gadget Supplies'
,'Clothing Mart')

-- task 7

select c.FirstName+' '+ c.LastName as CustomerName, max(o.OrderDate) MostRecentOrderDate  
from Customers c
left join Orders o on c.CustomerID=o.CustomerID 
group by FirstName+' '+ c.LastName


--task 8

select c.FirstName+' '+ c.LastName as CustomerName, sum(o.TotalAmount) OrderTotal from Orders o
join Customers c on o.CustomerID=c.CustomerID  
group by c.FirstName+' '+ c.LastName
having sum(o.TotalAmount)>500


--task 9

select p.ProductName, s.SaleDate, s.SaleAmount from Products p
join Sales s on p.ProductID=s.ProductID and year(s.SaleDate)='2022' and s.SaleAmount>400


--task 10

select p.ProductName, sum(s.SaleAmount) TotalSalesAmount from Sales s
join Products p on s.ProductID=p.ProductID 
group by p.ProductName


--task 11

select  e.Name, d.DepartmentName, e.Salary from Employees e
join Departments d  on e.DepartmentID=d.DepartmentID and d.DepartmentName= 'Human Resources' and
e.Salary>60000


--task 12

select p.ProductName, s.SaleDate, p.StockQuantity from Products p
join Sales s on p.ProductID=s.ProductID and year (s.SaleDate)='2023' and p.StockQuantity> 100


--task 13

select e.Name, d.DepartmentName, e.HireDate from Employees e
join Departments d on e.DepartmentID=d.DepartmentID and (d.DepartmentName='Sales' or e.HireDate>'2020')

--task 14

select o.OrderID, c.Address, o.OrderDate from Customers c
join Orders o on c.CustomerID=o.CustomerID and c.Country='USA' and c.Address like '[0-9][0-9][0-9][0-9]%'



--task 15

select p.ProductName , p.Category, s.SaleAmount from Products p
join Sales s on p.ProductID= s.ProductID 
join Categories c on p.Category=c.CategoryID and c.CategoryName= 'Electronics' and s.SaleAmount>350

--task 16 

select c.CategoryName, count(p.ProductID) ProductCount from Products p
join Categories c on p.Category=c.CategoryID 
group by c.CategoryName

--task 17

select c.FirstName+' '+ c.LastName as CustomerName, c.City, o.OrderID, o.TotalAmount from Customers c
join Orders o on c.CustomerID=o.CustomerID and c.City='Los Angeles' and o.TotalAmount>300


--task 18

select e.Name, d.DepartmentName from  Employees e
join Departments d on e.DepartmentID=d.DepartmentID and d.DepartmentName in('HR', 'Finance') 
and e.Name like '[AEIOUaeiou]%'

--task 19

select e.Name, d.DepartmentName, e.Salary from Employees e
join Departments d on e.DepartmentID=d.DepartmentID and d.DepartmentName in('Sales', 'Marketing') 
and e.Salary>60000
