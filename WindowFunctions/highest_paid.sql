--top 3 highest paid employee in each department
with cte as
(
select e.employeeid, e.firstname, e.lastname,d.departmentname, e.salary,
rank() over (partition by d.departmentname order by e.salary desc) as rnk
from Departments d
inner join Employees e
on d.departmentid=e.departmentid
)
select employeeid, firstname, lastname, departmentname, salary
from cte 
where rnk=1
