# Write your MySQL query statement below

WITH T AS (
    SELECT tiv_2016, COUNT(1) OVER (PARTITION BY tiv_2015) AS C1, COUNT(1) OVER (PARTITION BY lat, lon) AS C2
    FROM Insurance
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM T
WHERE C1 > 1 AND C2 = 1;