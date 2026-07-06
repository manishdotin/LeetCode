# Write your MySQL query statement below

SELECT D.name AS Department,E.name AS Employee, E.salary AS Salary
FROM Employee E
JOIN Department D ON E.departmentId = D.id
WHERE (
    SELECT COUNT(DISTINCT E1.salary)
    FROM EMPLOYEE E1
    WHERE E1.salary > E.salary
    AND E1.departmentId = E.departmentId
) < 3;