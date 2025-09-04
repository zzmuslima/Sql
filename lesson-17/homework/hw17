create database hw17
go
use hw17

--task 1

DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

SELECT 
    r.Region,
    d.Distributor,
    ISNULL(rs.Sales, 0) AS Sales
FROM
    (SELECT DISTINCT Region FROM #RegionSales) r
CROSS JOIN
    (SELECT DISTINCT Distributor FROM #RegionSales) d
LEFT JOIN 
    #RegionSales rs
    ON rs.Region = r.Region AND rs.Distributor = d.Distributor
ORDER BY 
    d.Distributor, r.Region;


  --task 2
  CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

;with cte as (
select  managerId ,count(managerId) cc from Employee e1
group by managerId
)
select name from cte 
join Employee on cte.managerId=Employee.id
where cc>=5

--task 3
CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

select* from Orders
;with cte as(
select p.product_name,sum(unit)summ from Products p
join Orders o on p.product_id=o.product_id and order_date between  '2020-01-31'  and '2020-02-28'
group by  p.product_name, p.product_id
)
select * from cte
where summ>= 100

--task 4

DROP TABLE Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');

;with cte  as(
select CustomerID,Vendor,sum(Count) as summ  from Orders
group by CustomerID, Vendor
)
select lol.CustomerID, c.Vendor from (
select CustomerID, max(summ) maxx from cte
group by CustomerID) as lol
join cte as c ON lol.maxx = c.summ
where maxx in(select max(summ) from cte group by CustomerID)

--task 5
declare @num int=2
DECLARE @Check_Prime INT = 53;
declare @check varchar(15) = 'not prime'

while @num<@Check_Prime
  begin
    if @Check_Prime%@num=0
      begin 
        set @check = 'not prime'
      end
    else
      begin 
        set @check = 'prime'
      end
    set @num= @num+1
  end
if @check = 'not prime'
  begin
    print('Not prime')
  end
else
  begin 
    print('Prime')
  end

--task 6
CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');

select * from Device
;with cte as (
select Device_id,Locations,count(Device_id) cnt from device
group by Locations, Device_id)
select lol.Device_id, Locations, l1.cnt2 as num_of_locatiom, s1.cnt3 as num_of_signals
from (select c1.Device_id, max(c1.cnt) max1 from cte c1 group by Device_id) as lol
join cte c2 on lol.max1 =c2.cnt
join (select Device_id,count(distinct Locations) as cnt2 from Device group by Device_id) as l1 on l1.Device_id=lol.Device_id
join (select Device_id,count(Device_id) as cnt3 from Device group by Device_id) as s1 on s1.Device_id=lol.Device_id

--task 7
drop table Employee
CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);
;with cte as 
(
select DeptID, avg(Salary) avg_sal from Employee
group by DeptID
)
select * from Employee as e1
join cte as c1 on e1.DeptID=c1.DeptID
where Salary >= avg_sal


--task 8
-- Step 1: Create the table
CREATE TABLE Numbers (
    Number INT
);

-- Step 2: Insert values into the table
INSERT INTO Numbers (Number)
VALUES
(25),
(45),
(78);


-- Step 1: Create the Tickets table
CREATE TABLE Tickets (
    TicketID VARCHAR(10),
    Number INT
);

-- Step 2: Insert the data into the table
INSERT INTO Tickets (TicketID, Number)
VALUES
('A23423', 25),
('A23423', 45),
('A23423', 78),
('B35643', 25),
('B35643', 45),
('B35643', 98),
('C98787', 67),
('C98787', 86),
('C98787', 91);



select * from Tickets as t1
join Numbers on t1.Number = Numbers.Number
right join (select TicketID from Tickets group by TicketID) as t2 on t2.TicketID = t1.TicketID


;with cte as (
select t2.TicketID, iif(t1.TicketID is null, count(t2.ticketid)-1, count(t2.ticketid)) as num from Tickets as t1
join Numbers on Numbers.Number = t1.Number
right join (select TicketID from Tickets group by TicketID)
as t2 on t1.TicketID = t2.TicketID
group by t2.TicketID, t1.TicketID)

select *,
case when num = cnt then 100
   when num = 0 then 0
else 10
end as amount
from cte
join (select TicketID, count(TicketID) cnt from Tickets group by TicketID)
as t2 on cte.TicketID = t2.TicketID


select * from Tickets
select * from Numbers
