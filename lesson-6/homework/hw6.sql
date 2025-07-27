--task1

SELECT DISTINCT
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl


--task 2


	select * from TestMultipleZero
	where  A+B+C+D <> 0

	--task 3

	   select  * from section1
	   where id % 2 = 1

	   -- task 4

	   select top 1 * from section1
	   order by id asc
	   
	   --task5

select top 1 * from section1
	   order by id desc

	   --task 6

	   select  * from section1
	    Where name like 'b%'

		-- task 7
	  
	   select * from ProductCodes
	   where code like '%[_]%'
