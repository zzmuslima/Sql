
--task 1

select ProductName, SupplierName from Products 
cross join Suppliers  

--task 2

select DepartmentName, Name from  Departments 
cross join Employees 

--task 3

select  p.ProductName, s.SupplierName from Products p
join Suppliers s on p.ProductID=s.SupplierID

--task 4

select c.FirstName+ ' '+ c.LastName as CustomerName , o.OrderID from  Orders o
join Customers c on o.CustomerID=c.CustomerID

--task 5 

select * from Courses 
cross join Students 

--task 6

select p.ProductName, o.OrderID from Products p
join Orders o on p.ProductID=o.ProductID

--task 7

select d.DepartmentID, d.DepartmentName from Departments d
join Employees e on d.DepartmentID=e.DepartmentID

--task 8
select s.Name, e.CourseID from Students s
join Enrollments e on s.StudentID=e.CourseID

--task 9

select * from Payments p
join Orders o on p.OrderID=o.OrderID


--task 10 

select * from Orders o
join Products p on p.ProductID=p.ProductID
where p.Price >100

--task 11

select e.Name, d.DepartmentName from Employees e
join Departments d on e.DepartmentID!=d.DepartmentID

--task12

select * from Orders o
join Products p on o.ProductID =p.ProductID
WHERE o.Quantity> p.StockQuantity

--task 13

select  c.FirstName+ ' '+ c.LastName as CustomerName ,s.ProductID from Customers c
join Sales s on c.CustomerID=s.CustomerID
where s.SaleAmount>= 500

--task 14

select s.Name, c.CourseName from Students s
join Enrollments e on s.StudentID=e.StudentID
join Courses c on c.CourseID=e.CourseID


--task 15
select s.SupplierName, p.ProductName from Products p
join Suppliers s on p.SupplierID=s.SupplierID
where s.SupplierName like  '%Tech%'

--task 16

select * from Orders o
join Payments p on o.OrderID=p.OrderID
where p.Amount<o.TotalAmount

--task 17

select e.Name, d.DepartmentName from Employees e
join Departments d on e.DepartmentID =e.DepartmentID

--task 18

select * from Products p
join Categories c on p.Category=c.CategoryID
where c.CategoryName in ('Electronics', 'Furniture')


--task 19

select *from Customers c
join Sales s on c.CustomerID=s.CustomerID
where c.Country='USA'

--task 20

select *from Orders o
join Customers c on o.CustomerID=c.CustomerID
where c.Country='Germany' and o.TotalAmount>100

--task 21

select e1.Name e1Name, e2.Name e2Name from Employees e1
join Employees e2 on e1.EmployeeID<e2.EmployeeID
where e1.DepartmentID<> e2.DepartmentID


--task 22

select * from Payments p
join Orders o on p.OrderID=o.OrderID
join Products p1 on o.ProductID=p1.ProductID
where p.Amount<>(o.Quantity*p1.Price)

--task 23

select s.Name, e.EnrollmentID, c.CourseName from Students s
left join Enrollments e on s.StudentID=e.StudentID
left join Courses c on c.CourseID=e.EnrollmentID
where c.CourseName is null

--task 24

select* from Employees e1
join Employees e2 on e1.EmployeeID=e2.ManagerID
where e1.Salary<=e2.Salary

--task 25

select  c.FirstName+ ' '+ c.LastName as CustomerName, o.OrderID, p.PaymentID  from Orders o
left join Payments p on o.OrderID=p.OrderID
 join Customers c on c.CustomerID= o.CustomerID
where p.PaymentID is null
