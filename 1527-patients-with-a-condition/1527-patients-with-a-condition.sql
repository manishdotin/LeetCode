# Write your MySQL query statement below

SELECT *
FROM Patients
WHERE coNditions LIKE 'DIAB1%'
OR conditions LIKE '% DIAB1%';