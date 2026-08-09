# Write your MySQL query statement below

SELECT E.employee_id
FROM Employees E
LEFT JOIN Employees M ON E.manager_id = M.employee_id
WHERE E.salary < 30000
AND E.manager_id IS NOT NULL
AND M.employee_id IS NULL
ORDER BY 1;