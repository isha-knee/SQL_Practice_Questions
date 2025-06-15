Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
--id is the primary key (column with unique values) for this table.
--Each row of this table contains information about the salary of an employee.
--Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null 
SELECT 
    (SELECT salary 
     FROM (
         SELECT DISTINCT salary, 
                RANK() OVER (ORDER BY salary DESC) AS rnk
         FROM Employee
     ) cte
     WHERE rnk = 2
    ) AS SecondHighestSalary;

--You can use another way to write this, which will efficiently handle the null values.

with cte as
(
select salary,
rank() over (order by salary desc) as rnk
from Employee
)
select 
max(case when rnk=2 then salary else null end) as SecondHighestSalary
from cte;
