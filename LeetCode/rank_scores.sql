Table: Scores
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+
id is the primary key (column with unique values) for this table.
--Each row of this table contains the score of a game. Score is a floating point value with two decimal places.
--Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
--The scores should be ranked from the highest to the lowest.
--1) If there is a tie between two scores, both should have the same ranking.
--2)After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
--3)Return the result table ordered by score in descending order.
select score, 
dense_rank() over (order by score desc) as rank
from Scores
order by score desc
