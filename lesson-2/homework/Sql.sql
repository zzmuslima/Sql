--Task 1
create table Employees (EmpID int, Name varchar(50), Salary decimal(10,2))

--Task 2
-- Single row insert
insert into Employees
values (1, 'Alice', 2000)


-- Multiple row insert
insert into Employees
values
(2, 'Bob', 1800),
(3, 'Charlie', 1700),
(4, 'Diana', 8000)

--Task 3
update Employees
set Salary = 7000
where EmpID = 1

--Task 4
delete Employees
where EmpID = 2

--Task 5
/*
Delete: A DML command used to remove specific rows from a table, often with a WHERE clause.

Truncate: A DDL command used to remove all rows from a table quickly, effectively emptying it while keeping its structure.

Drop: A DDL command used to completely remove an object (like a table, view, or index) from the database.
*/

--Task 6
alter table Employees
alter column Name varchar(100)

--Task 7
alter table Employees
add Department varchar(50)

--Task 8
alter table Employees
alter column Salary float

--Task 9
create table Departments (DepartmentID int primary key, DepartmentName varchar(50))

--Task 10
truncate table Employees

--Task 11
insert into Departments
values
(101, 'Sales'),
(102, 'Marketing'),
(103, 'Finance'),
(103, 'IT'),
(103, 'HR')

select * from Employees

--Task 12
update Employees
set Department = 'Management'
where Salary > 5000

--Task 13
delete from Employees

--Task 14
alter table Employees
drop column Department

--Task 15
exec sp_rename 'Employees', 'StaffMembers';

--Task 16
drop table Departments


--Task 17 & 18
create table Products (ProductID int primary key, ProductName varchar(100),Category varchar(50), Price decimal(10, 2), Location varchar(50), check (Price > 0))


--Task 19
alter table Products
add StockQuantity int default(50)


--Task 20
exec sp_rename 'Products.Category',  'ProductCategory', 'COLUMN';

--Task 21
insert into Products
values
(1, 'Laptop', 'Electronics', 1200.00, 'Online Store', 25),
(2, 'Desk Chair', 'Furniture', 150.00, 'Office Supply', 60),
(3, 'Coffee Maker', 'Appliance', 75.50, 'Department Store', 30),
(4, 'Running Shoes', 'Apparel', 90.00, 'Sports Shop', 80),
(5, 'External Hard Drive', 'Electronics', 80.00, 'Tech Retailer', 45)

--Task 22
select * into Products_Backup from Products


--Task 23
exec sp_rename 'Products', 'Inventory';

--Task 24
alter table Inventory
alter column Price float

--Task 25
alter table Inventory
add ProductCode int identity(1000, 5)
