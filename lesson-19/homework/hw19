create database hw19
go
use hw19

--task 1

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE DepartmentBonus (
    Department NVARCHAR(50) PRIMARY KEY,
    BonusPercentage DECIMAL(5,2)
);

INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'Sales', 5000),
(2, 'Jane', 'Smith', 'Sales', 5200),
(3, 'Mike', 'Brown', 'IT', 6000),
(4, 'Anna', 'Taylor', 'HR', 4500);

INSERT INTO DepartmentBonus VALUES
('Sales', 10),
('IT', 15),
('HR', 8);


create proc blala
as
begin
select EmployeeID,FirstName+ ' ' + LastName as FullName, e.Department, Salary ,
Salary * BonusPercentage / 100 as BonusAmount into #EmployeeBonus from Employees e
join DepartmentBonus d on e.Department=d.Department
select * from #EmployeeBonus
end

exec blala

--2

alter proc lala
@depName varchar(30),
@incPercentage int
as
begin
update Employees
set Salary=Salary*@incPercentage/100+Salary
where Department=@depName
select * from Employees
where Department=@depName
end

exec lala 'Sales', 10


--task 3
CREATE TABLE Products_Current (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Products_New (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Current VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 600),
(3, 'Smartphone', 800);

INSERT INTO Products_New VALUES
(2, 'Tablet Pro', 700),
(3, 'Smartphone', 850),
(4, 'Smartwatch', 300);

MERGE INTO products_current AS p1
USING products_new AS p2
ON p1.productname = p2.productname

WHEN MATCHED THEN
    UPDATE SET p1.price = p2.price

WHEN NOT MATCHED BY TARGET THEN
    INSERT (productid, productname, price)
    VALUES (p2.productid, p2.productname, p2.price)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

  select* from Products_Current
--task 4

select *,
case when p_id is null then 'Root'
   when id in (select p_id from Tree) then 'Inner'
   else 'Leaf' end as Branch
from Tree

--task 5
CREATE TABLE Signups (user_id INT, time_stamp DATETIME);
CREATE TABLE Confirmations (user_id INT, time_stamp DATETIME, action VARCHAR(20) CHECK (action IN ('confirmed', 'timeout')));

TRUNCATE TABLE Signups;
INSERT INTO Signups (user_id, time_stamp) VALUES 
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

TRUNCATE TABLE Confirmations;
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES 
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');


select * from Signups
select s.user_id, cast(CAST(isnull(t1.cnt, 0)*100/isnull(t2.all1, 1) as decimal(10,2))/100 as decimal(10,2)) as confirmation_rate
from (select user_id,action, count(action) as cnt from Confirmations
where action = 'confirmed'
group by user_id, action) as t1
join
(select user_id,COUNT(action) as all1 from Confirmations
group by user_id) as t2 on  t1.user_id = t2.user_id
right join Signups s on t1.user_id = s.user_id 


--task 6

CREATE TABLE employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees1 (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select * from employees1
where salary= (select min(salary )from employees1)


--task 7

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT ,
    Quantity INT,
    SaleDate DATE
);
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop Model A', 'Electronics', 1200),
(2, 'Laptop Model B', 'Electronics', 1500),
(3, 'Tablet Model X', 'Electronics', 600),
(4, 'Tablet Model Y', 'Electronics', 700),
(5, 'Smartphone Alpha', 'Electronics', 800),
(6, 'Smartphone Beta', 'Electronics', 850),
(7, 'Smartwatch Series 1', 'Wearables', 300),
(8, 'Smartwatch Series 2', 'Wearables', 350),
(9, 'Headphones Basic', 'Accessories', 150),
(10, 'Headphones Pro', 'Accessories', 250),
(11, 'Wireless Mouse', 'Accessories', 50),
(12, 'Wireless Keyboard', 'Accessories', 80),
(13, 'Desktop PC Standard', 'Computers', 1000),
(14, 'Desktop PC Gaming', 'Computers', 2000),
(15, 'Monitor 24 inch', 'Displays', 200),
(16, 'Monitor 27 inch', 'Displays', 300),
(17, 'Printer Basic', 'Office', 120),
(18, 'Printer Pro', 'Office', 400),
(19, 'Router Basic', 'Networking', 70),
(20, 'Router Pro', 'Networking', 150);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-15'),
(2, 1, 1, '2024-02-10'),
(3, 1, 3, '2024-03-08'),
(4, 2, 1, '2024-01-22'),
(5, 3, 5, '2024-01-20'),
(6, 5, 2, '2024-02-18'),
(7, 5, 1, '2024-03-25'),
(8, 6, 4, '2024-04-02'),
(9, 7, 2, '2024-01-30'),
(10, 7, 1, '2024-02-25'),
(11, 7, 1, '2024-03-15'),
(12, 9, 8, '2024-01-18'),
(13, 9, 5, '2024-02-20'),
(14, 10, 3, '2024-03-22'),
(15, 11, 2, '2024-02-14'),
(16, 13, 1, '2024-03-10'),
(17, 14, 2, '2024-03-22'),
(18, 15, 5, '2024-02-01'),
(19, 15, 3, '2024-03-11'),
(20, 19, 4, '2024-04-01');

select * from Products
select * from Sales



create proc GetProductSalesSummary
@productid int
as
begin 
select ProductName, sum(Quantity) as Total_Quantity_Sold,
sum(Quantity)*Price as Total_Sales_Amount, min(SaleDate) as First_Sale_Date,
max(SaleDate) as last_sale_date
from sales as s
right join Products as p on s.ProductID = p.ProductID
where p.productid = @productid
group by ProductName, Price
end

exec GetProductSalesSummary 4
