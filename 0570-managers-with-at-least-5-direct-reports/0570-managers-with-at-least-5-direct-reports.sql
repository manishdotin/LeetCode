# Write your MySQL query statement below

SELECT name
FROM Employee
JOIN (
    SELECT managerId AS id, COUNT(1) AS count
    FROM Employee
    GROUP BY 1
    HAVING count >= 5
) AS T
USING (id);