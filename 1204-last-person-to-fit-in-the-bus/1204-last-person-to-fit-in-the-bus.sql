# Write your MySQL query statement below

SELECT person_name
FROM Queue Q
WHERE (
    SELECT SUM(weight)
    FROM Queue
    WHERE turn <= Q.turn
) <= 1000
ORDER BY turn DESC
LIMIT 1; 