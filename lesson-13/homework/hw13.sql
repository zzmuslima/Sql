--task 1

select concat(EMPLOYEE_ID, '-',FIRST_NAME, LAST_NAME) as Name from employees


--task 2

update Employees
set PHONE_NUMBER= REPLACE(PHONE_NUMBER,124,999)

--task 3

select FIRST_NAME, len(FIRST_NAME) lenth_name
from Employees
where FIRST_NAME like 'A%' OR FIRST_NAME like 'J%'  OR  FIRST_NAME like 'M%' 


--task 4

select FIRST_NAME+ ' '+ LAST_NAME as Name ,sum(SALARY) as total_salary from Employees
group by FIRST_NAME+ ' '+ LAST_NAME


--task 5

select *, GREATEST(max1,Max2,Max3) as TestMax from TestMax

--task 6

select id, movie,description from cinema
where id % 2=1 and description='boring'


--task 7


select * from SingleOrder
order by CASE WHEN id =0 THEN 100000 ELSE id END

--task 8

select coalesce(ssn,passportid,itin)
from person

--task 9

select SUBSTRING(FullName,1, CHARINDEX(' ', FullName)-1) as FirstName ,
SUBSTRING(Fullname, CHARINDEX(' ', FullName )+1, Charindex(' ', FullName,Charindex(' ',FullName)+1) - Charindex(' ', FullName)) as  MiddleName,
substring(FullName,  CHARINDEX(' ', FullName, CHARINDEX(' ', FullName )+1 )+1, len(fullname)) as LastName
from Students


--task 10


select * from Orders
where DeliveryState = 'TX' AND CustomerID in (select CustomerID from Orders
where DeliveryState = 'CA')


-- task 11
select STRING_AGG(String, ' ')  as query from DMLTable


--task 12


select FIRST_NAME+ ' ' +LAST_NAME as fullname from Employees
where  FIRST_NAME+ ' ' +LAST_NAME like '%a%a%a%'

--task 13

select DEPARTMENT_ID, count(EMPLOYEE_ID) as totalem, count(EMPLOYEE_ID)*100/(select COUNT(EMPLOYEE_ID) from Employees where year(GETDATE())- year(HIRE_DATE)>3)  from Employees
where year(GETDATE())- year(HIRE_DATE)>3
group by DEPARTMENT_ID


--task 14

select min(MissionCount) [min], max(MissionCount) [max], JobDescription from Personal
group by JobDescription

--task 15
--we have not covered this this topic

--task 16

select *, (select sum(Grade) from Students as s1 where s1.StudentID<=Students.StudentID) from Students



--task 17

--we have not covered this this topic


--task 18

select*from Student as s1
cross join student as s2
where s1.Birthday=s2.Birthday and s1.StudentName!= s2.StudentName

--task 19

select GREATEST(PlayerA,PlayerB) as p1, LEAST(PlayerA, PlayerB) as p2, sum(Score )from PlayerScores
group by GREATEST(PlayerA,PlayerB) , LEAST(PlayerA, PlayerB) 
