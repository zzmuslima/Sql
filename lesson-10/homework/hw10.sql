--task 1

select  emp.Name, emp.Salary, dep.DepartmentName  from Employees emp
join Departments dep on emp.DepartmentID= dep.DepartmentID
where emp.Salary> 50000

--task 2

SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 2023;


--task 3 
select e.Name, d.DepartmentName from Employees e
left join Departments d on e.DepartmentID= d.DepartmentID


--task 4

select s.SupplierName, p.ProductName from Products p
left join Suppliers s on p.SupplierID= s.SupplierID


--task 5

select o.OrderID, o.OrderDate, p.PaymentDate, p.Amount from Orders o
full join Payments  p on o.OrderID=p.OrderID 

--task 6

select e1.Name, e2.Name from Employees e1
left join Employees e2 on e1.ManagerID= e2.EmployeeID


--task 7

select s.Name, c.CourseName from Students s
join Enrollments e on s.StudentID= e.StudentID
join Courses c on c.CourseID= e.CourseID
where c.CourseName='Math 101'

-- task 8

select c.FirstName, c.LastName, o.Quantity from Customers c
join Orders o on c.CustomerID= o.CustomerID
where o.Quantity>3

--task 9

select e.Name, d.DepartmentName from Employees e
join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName= 'Human Resources'

--task 10 

select d.DepartmentName, count(e.EmployeeID) EmployeeCount from Employees e
join Departments d on e.DepartmentID= d.DepartmentID
group by d.DepartmentName
having count(e.EmployeeID)>5

--task 11 

select p.ProductID, p.ProductName from Products p
left join Sales s on p.ProductID= s.ProductID
where	s.SaleID is null

--task 12
select c.FirstName, c.LastName,  COUNT(o.OrderID) AS TotalOrders from Customers c
 join Orders o on c.CustomerID=o.CustomerID
group by c.FirstName, c.LastName

--task 13
select e.Name, d.DepartmentName  from Employees e
join Departments d on e.DepartmentID= d.DepartmentID

--task 14
select e1.Name,e2.Name, e2.ManagerID from Employees e1
join Employees e2 on e1.EmployeeID= e2.ManagerID

--task 15
select o.OrderID, o.OrderDate, c.FirstName, c.LastName from Orders o
join Customers c on o.CustomerID=c.CustomerID
where year(o.OrderDate)= '2022'

--task 16
select e.Name, e.Salary, d.DepartmentName from Employees e
join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName ='Sales' and e.Salary>60000

--task 17
select o.OrderID, o.OrderDate, p.PaymentDate, p.Amount from Orders o
join Payments p on o.OrderID=p.OrderID

--task 18
select  p.ProductID, p.ProductName from Products p
left join Orders o on p.ProductID=o.ProductID
where o.OrderID is null

--task 19
 select e2.Name, e2.Salary from Employees e2
 join 
(Select d.DepartmentID, d.DepartmentName, avg(e1.Salary) avgsal from Employees e1
join Departments d on e1.DepartmentID=d.DepartmentID 
group by d.DepartmentName , d.DepartmentID) d2 on e2.DepartmentID=d2.DepartmentID
where d2.avgsal< e2.Salary


--task 20
select o.OrderDate, o.OrderDate  from Orders o
left join Payments p on o.OrderID=p.OrderID
where year(o.OrderDate)< '2020' and p.OrderID is null

--task 21

select  p.ProductID, 
    p.ProductName from Products p
left join Categories c on p.Category=c.CategoryID
WHERE c.CategoryID IS NULL


--task 22

select e1.Name,e2.Name, e1.Salary, e2.ManagerID from Employees e1
join Employees e2 on e1.EmployeeID=e2.ManagerID
where e1.Salary>60000
 

 --task 23

 select e.Name, d.DepartmentName from  Employees e
 join Departments d on e.DepartmentID=d.DepartmentID
 where DepartmentName like 'M%'

 --task 24

 select s.SaleID, p.ProductName, s.SaleAmount from Products p
 join Sales s on p.ProductID=s.ProductID
 where s.SaleAmount> 500

 --task 25

 select * from Students s
 left join Enrollments e on s.StudentID=e.StudentID
 left join Courses c on c.CourseID= e.CourseID
where c.CourseName >='Math 101'

--task 26

select o.OrderID, o.OrderDate, p.PaymentID from Orders o
left join Payments p on o.OrderID=p.OrderID
where p.PaymentID is null


--task 27

select p.ProductID, p.ProductName, c.CategoryName
 from Products p
join Categories c on p.Category=c.CategoryID
where c.CategoryName = 'Electronics' or c.CategoryName='Furniture'

