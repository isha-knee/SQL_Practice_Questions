--You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
--It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.
--If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.
--Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
--If there is more than one project that have the same number of completion days, then order by the start date of the project.
WITH Projects_With_Group AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
         DATEADD(DAY, -ROW_NUMBER() OVER (ORDER BY End_Date), End_Date) AS grp
    FROM Projects
),
Project_Bounds AS (
    SELECT
        MIN(Start_Date) AS Project_Start,
        MAX(End_Date) AS Project_End,
        COUNT(*) AS Duration
    FROM Projects_With_Group
    GROUP BY grp
)
SELECT
    Project_Start,
    Project_End
FROM Project_Bounds
ORDER BY Duration ASC, Project_Start;

