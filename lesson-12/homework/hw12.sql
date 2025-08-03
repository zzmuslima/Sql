

--task 1

select P.forstName, p.lastName, a.city, a.state from Person p
left join Address a on  p.personID= a.personID


--task 2


select *from Employee e1
join  Employee Manager on e1.managerId=Manager.id
where e1.salary>Manager.salary


--task 3

select email from Person
group by email
having count(email)>1


--task 4

DELETE FROM Email
WHERE email = (SELECT email FROM Email
GROUP BY email
HAVING COUNT(email) >1

--task 5

select distinct g.ParentName from boys b
right  join girls g on b.ParentName=g.ParentName
where b.Id is null

--task 6
select custid, sum( freight), min(freight) from Sales.Orders
group by custid
having sum(freight)>50

--task 7


select * from Cart1 c1
full join Cart2 c2 on c1.Item=c2.Item



--task 8


select c.name from Customers c
left join Orders o on c.id=o.customerId
where o.customerId is null




--task 9

select s.student_id, s.student_name, s1.subject_name, isnull(count(e.student_id),0) as attended from students s
left join Examinations e on s.student_id=e.student_id
left join Subjects s1 on e.subject_name=s1.subject_name
group by  s.student_id, s.student_name, s1.subject_name
