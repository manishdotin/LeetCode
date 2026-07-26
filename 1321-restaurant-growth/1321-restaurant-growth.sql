# Write your MySQL query statement below

SELECT A.visited_on, SUM(B.amount) AS amount, ROUND(SUM(B.amount) / 7, 2) AS average_amount
FROM (SELECT DISTINCT visited_on
      FROM Customer) AS A
JOIN Customer AS B ON DATEDIFF(A.visited_on, B.visited_on) BETWEEN 0 AND 6
WHERE A.visited_on >= (SELECT MIN(visited_on) FROM Customer) + 6
GROUP BY 1
ORDER BY 1;