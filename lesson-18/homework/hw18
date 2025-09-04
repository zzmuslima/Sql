create database hww18
go
use hww18

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');


--task 1

select s.ProductId, sum(Quantity) as totalquantity, sum(Quantity)* price as totalrevenue into #Monthlysales
from Sales as s
join Products as p on p.ProductID=s.ProductID
where SaleDate between '2025-04-01' and '2025-04-30'
group by s.ProductID, Price

select * from #MonthlySales

--task 2
create view vw_ProductSalesSummary  as
select s.ProductID, p.productName,p.category, sum(Quantity) totalquantitysold from Sales s
join Products p on s.ProductID=p.ProductID
group by s.ProductID, p.productName,p.category

select * from vw_ProductSalesSummary


--task 3

create function fn_GetTotalRevenueForProduct(@ProductID INT)
returns decimal(10,2)
as
begin 
declare @answer decimal(10,2)
set @answer =cast((select sum(Quantity)*Price from Sales
join products p on Sales.ProductID=p.ProductID
where Sales.ProductID=@ProductID
group by Sales.ProductID, Price) as decimal(10,2))
return @answer
end

select dbo. fn_GetTotalRevenueForProduct(1) as oulalala

--task 4

create function fn_GetSalesByCategory(@Category VARCHAR(50))
returns table
as
return 
(select p.ProductName,sum(Quantity) as TotalQuantity, sum(Quantity)*Price as TotalRevenue from Sales s
join Products p on s.ProductID=p.ProductID
where p.Category=@Category
group by p.ProductName, Price)

SELECT * FROM dbo.fn_GetSalesByCategory('Electronics');

--task 5

  Create function dbo.fn_IsPrime (@Number INT)
Returns varchar(10)
as
begin
declare @num int =2
declare @check varchar(10)= 'Not prime'

while @num<@Number

begin

if @Number%@num=0
begin
set  @check= 'Not prime'
break
end
else 
begin
set @check= 'Prime'
end
set @num =@num+1
end
if @check= 'Not prime'
begin
return 'NO'
end
else
begin
return 'Yes'
end
return 'idk'
end

select dbo.fn_IsPrime(8) as lalalalala

--task 6


create function fn_GetNumbersBetween( @Start INT, @End INT)
returns table
as
;with cte as(
select @Start as sstart, @End as eEnd 
union all
select sstart +1, eEnd from cte
where sstart+1<=eEnd
)
return
select * from cte
CREATE FUNCTION fn_GetNumbersBetween (@Start INT, @End INT)
RETURNS @Result TABLE (Number INT)
AS
BEGIN
    WITH cte AS (
        SELECT @Start AS Number
        UNION ALL
        SELECT Number + 1
        FROM cte
        WHERE Number + 1 <= @End
    )
    INSERT INTO @Result
    SELECT Number FROM cte
    OPTION (MAXRECURSION 0); -- Allow more than 100 recursion levels if needed

    RETURN;
END

SELECT * FROM dbo.fn_GetNumbersBetween(2, 12);


--task 7

create table Employee (id int, salary int)

insert into Employee 
values
(4,10),(5,60),(6,50)

update  Employee
set Salary=200
where id=3

select * from Employee

create function getNthHighestSalary(@N INT)
returns int
as
begin
if (select count(*) from Employee) < @n
begin
return NULL
end
else
begin
return (
select min(salary) as HighestNSalary from (select top (@N) * from Employee
order by salary DESc) as LOl)
end
return -1
end
select count(*) from Employee
select dbo.getNthHighestSalary(8)

select min(salary) as HighestNSalary from (select top 3 * from Employee
order by salary DESc) as LOl

--task 8

create table friends(requester_id int, accepter_id int)
insert into friends values(1,2), (1,3), (2,3), (3,4)

select top 1 ppl, count(ppl) as cnt from (
select requester_id as ppl from friends
union all
select accepter_id as ppl from friends) dunno
group by ppl
order by cnt desc
--task 9
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);

create view vw_CustomerOrderSummary  as 
select c.customer_id, name, count(order_id) as total_orders,
sum(amount) as total_amount, max(order_date) as last_order_date  from Orders o
join Customers c on o.customer_id = c.customer_id
group by c.customer_id, name

--task 10

DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)


SELECT 
    RowNumber,
    LAST_VALUE(TestCase) IGNORE NULLS OVER (
        ORDER BY RowNumber 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Workflow
FROM Gaps
ORDER BY RowNumber;
