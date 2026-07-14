# Write your MySQL query statement below

WITH S AS (
    SELECT *, id - (ROW_NUMBER() OVER (ORDER BY id )) AS RK
    FROM Stadium
    WHERE people >= 100
), T AS (SELECT *, COUNT(1) OVER (PARTITION BY RK) AS C FROM S)
SELECT id, visit_date, people
FROM T
WHERE C >= 3
ORDER BY 1;
