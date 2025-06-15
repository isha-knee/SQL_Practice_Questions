Table: Logs
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
--In SQL, id is the primary key for this table.
--id is an autoincrement column starting from 1.
--Find all numbers that appear at least three times consecutively. Return the result table in any order.
select distinct num as ConsecutiveNums
from
(
select num,
    lag(num,1) over (order by id) as previous,
    lead(num,1) over (order by id) as next
from Logs
) cte
where num=previous and num=next
