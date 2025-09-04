--task 1
;with cte as(
select 0 as num
union all
select num+1 from cte where num<1000 )
select * from cte
OPTION (MAXRECURSION 1001);

--task 2

select *from Employees
Join (select EmployeeID, sum(SalesAmount) as suma from Sales
group by EmployeeID) as lol ON Employees.EmployeeID = lol.EmployeeID

--task 3

;with cte as 
(
select avg(Salary) avgg from Employees
)
select * from cte


--task 4

select * from Products
join (select productid, max(SalesAmount) as maxx from Sales group by ProductID ) as lolo
on Products.ProductID=lolo.ProductID


--task 5

;with cte as(
select 1 num 
union all
select num* 2 from cte where num<1000000
)
select * from cte
OPTION (MAXRECURSION 1000);

--task 6

;with cte as(
select EmployeeID, count(SalesID) cc from Sales
group by EmployeeID
)

select * from Employees
join( select *  from cte
where cc>=5) as lala on Employees.EmployeeID=lala.EmployeeID


--task 7

;with cte as (
select SalesID, ProductID,SalesAmount from Sales
where SalesAmount>500
)

select * from Products
join cte on Products.ProductID=cte.ProductID


--task 8

;with cte as(
select EmployeeID, FirstName,  Salary from Employees
where( select avg(Salary) avgg from Employees )< Salary
)

select * from cte
--medium lvl
--task 1

select top 5 * from Employees
join (select EmployeeID,count(SalesID)as cs from Sales group by EmployeeID) as css on Employees.EmployeeID=css.EmployeeID

--task 2
select CategoryID, sum(cp.cc) from Products
join(
select ProductID,count(SalesID) as cc from Sales
group by ProductID) as cp on Products.ProductID=cp.ProductID
group by CategoryID

-- task 3
select *from Numbers1

;WITH FactorialCTE AS (
    -- Anchor: start with 1 for each number
    SELECT 
        Number,
        1 AS Step,
        1 AS Fact
    FROM Numbers1

    UNION ALL

    SELECT 
        Number,
        Step + 1,
        Fact * (Step + 1)
    FROM FactorialCTE
    WHERE Step + 1 <= Number
)
SELECT 
    Number,
  Fact
    --MAX(Fact) AS Factorial
FROM 
    FactorialCTE
GROUP BY 
    Number
OPTION (MAXRECURSION 100); -- Increase if input numbers are > 100

--task 4
select * from Example

;WITH cte AS (
    SELECT 
        String,
        1 AS Position,
        SUBSTRING(String, 1, 1) AS Character
    FROM Example

    UNION ALL

    SELECT 
        String,
        Position + 1,
        SUBSTRING(String, Position + 1, 1)
    FROM cte
    WHERE Position < LEN(String)
)
SELECT * FROM cte
OPTION (MAXRECURSION 1000); 


--task 5


;with cte as (
select YEAR(SaleDate) as [year],MONTH(SaleDate) as [month],sum(SalesAmount) as avg_amount from Sales
group by YEAR(SaleDate),Month(SaleDate))

select *, c1.avg_amount - c2.avg_amount as diff_amount from cte as c1
left join cte as c2 on c1.month - 1 = c2.month

--task 6
;with cte as (
select year(saledate) year1, EmployeeID, sum(SalesAmount) as sum1 from Sales
group by  year(saledate), DATEPART(QUARTER, SaleDate), EmployeeID
)

select * from cte where sum1 > 45000


  --task 1

  ;WITH FibonacciCTE AS (
    -- Anchor members: first two numbers of Fibonacci sequence
    SELECT 
        0 AS n, 
        0 AS Fib
    UNION ALL
    SELECT 
        1 AS n, 
        1 AS Fib

    UNION ALL

    -- Recursive member
    SELECT 
        n + 1,
        prev.Fib + curr.Fib
    FROM 
        FibonacciCTE curr
    JOIN 
        FibonacciCTE prev ON curr.n = prev.n + 1
    WHERE 
        n < 20  -- Limit the sequence to avoid infinite recursion
)
SELECT 
    n, 
    Fib
FROM 
    FibonacciCTE
ORDER BY 
    n
OPTION (MAXRECURSION 100);

--task 2
select REPLACE(vals,left(vals,1),'') lal, 
case when REPLACE(vals,left(vals,1),'')='' then 'similar'
else 'not similar'
end as lala
from FindSameCharacters

--task 3
;with cte as (
select 1 as n, cast('1' as varchar(50)) as ch
union all
select n+1, cast(ch+cast(n+1 as varchar(10)) as varchar(50))
from cte
where n<20
)

select * from cte

--task 4

select EmployeeID,sum(SalesAmount) summa from Sales
where  SaleDate > DATEADD(MONTH, -6, GETDATE())
group by EmployeeID

--task 5
--we have not covered this topic
