# Write your MySQL query statement below

SELECT project_id, ROUND(AVG(experience_years * 1.00), 2) AS average_years
FROM Project P
LEFT JOIN Employee E ON P.employee_id = E.employee_id
GROUP BY project_id;