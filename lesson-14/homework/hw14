--easy lvl
--task 1
select * from TestMultipleColumns
select SUBSTRING(Name,1, CHARINDEX(',', Name)-1) as FirstName ,
SUBSTRING(Name, CHARINDEX(',', Name)+1, len(Name)) as surname
from TestMultipleColumns



--task 2

select * from TestPercent
where Strs like '%[%]%'

--task 3
select string_split(Vals,1, charindex('.',Vals)-1) as 1 from Splitter


select * from string_split(Vals,)


--task 4

DECLARE @input VARCHAR(MAX) = '1234ABC123456XYZ1234567890ADS';
SELECT 
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(@input, '0', 'X'), '1', 'X'), '2', 'X'), '3', 'X'), '4', 'X'),
    '5', 'X'), '6', 'X'), '7', 'X'), '8', 'X'), '9', 'X') AS ReplacedString



  --task 5

  select Vals from testDots
  where Vals like '%.%.%'

  --task 6

SELECT LEN(texts)-LEN(REPLACE(texts, ' ', '')) as spaceless FROM CountSpaces

--task 7 

select *from Employee e1
where (select Salary from Employee e2 where e1.ManagerId=e2.Id)< Salary

--task 8

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE,  DATEDIFF(year, HIRE_DATE, GETDATE()) Years_of_service
from Employees
where DATEDIFF(year, HIRE_DATE, GETDATE()) between 10 and 15

--medium lvl
--task 1


--task 2
select Id from weather w1
where (select Temperature from weather w2 where w1.Id-1=w2.Id) < Temperature

--task 3

select player_id,min(event_date) from Activity
group by player_id

--task 4

select* from string_split('apple,banana,orange,grape', ',',1)
where ordinal=3

--task5
SELECT 
    SUBSTRING('sdgfhsdgfhs@121313131', number, 1) AS character
INTO CharactersTable
FROM master.dbo.spt_values
WHERE type = 'P' 
  AND number BETWEEN 1 AND LEN('sdgfhsdgfhs@121313131');


  --task 6

  select p1.id,iif(p1.code=0, p2.code,p1.code) code, p2.id, p2.code from p1
  join p2 on p1.id=p2.id 

  --task 7
  select*,
  case when (year(GETDATE())-year(HIRE_DATE))<1 then 'New'
  when (year(GETDATE())-year(HIRE_DATE)) between 1 and 5 then 'Junior'
  when (year(GETDATE())-year(HIRE_DATE)) between 5 and 10 then 'Mid_lvl'
  when (year(GETDATE())-year(HIRE_DATE)) between 10 and 20 then 'Senior'
  else 'Veteran'
  end as Employment_Stage 
  from Employees

  ---task 8

SELECT 
    Vals+'X',
    LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'X') - 1) AS StartingInteger
FROM GetIntegers
WHERE PATINDEX('%[0-9]%', Vals) = 1;

--hard lvl
--task 1

SELECT 
  STUFF(
    STUFF(Vals, 1, CHARINDEX(',', Vals) - 1, 
        SUBSTRING(Vals, CHARINDEX(',', Vals) + 1, CHARINDEX(',', Vals + ',', CHARINDEX(',', Vals) + 1) - CHARINDEX(',', Vals) - 1)
    ),
    CHARINDEX(',', Vals) + 1,
    CHARINDEX(',', Vals + ',', CHARINDEX(',', Vals) + 1) - CHARINDEX(',', Vals) - 1,
    LEFT(Vals, CHARINDEX(',', Vals) - 1)
  ) AS SwappedVals
FROM MultipleVals;


--task 2

select player_id,min(device_id) from Activity
group by player_id

--task 3
select FinancialWeek,Area, sum(saleslocal)+sum(SalesRemote),
(sum(saleslocal)+sum(SalesRemote))*100/(select sum(SalesLocal)+sum(SalesRemote) from WeekPercentagePuzzle)
from WeekPercentagePuzzle
group by FinancialWeek,Area
