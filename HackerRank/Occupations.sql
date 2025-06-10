--Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
--The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names 
--listed alphabetically under each column.
--Note: Print NULL when there are no more names corresponding to an occupation.
with cte1 as
(
select name,occupation,
row_number() over (partition by occupation order by name) as row_num
from OCCUPATIONS
    ),
cte2 as
(
select
max(case when occupation='Doctor' then Name end) as Doctor,
max(case when occupation= 'Professor' then Name end) as Professor,
max(case when occupation='Singer' then Name end)as Singer,
max(case when occupation='Actor' then Name end) as Actor
    from cte1
    group by row_num
    )
    select Doctor,Professor,Singer,Actor
    from cte2
