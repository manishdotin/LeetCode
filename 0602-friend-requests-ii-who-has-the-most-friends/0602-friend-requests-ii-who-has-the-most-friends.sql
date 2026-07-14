# Write your MySQL query statement below

SELECT id, COUNT(id) AS num
FROM (
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id
    FROM RequestAccepted
) ppl
GROUP BY id
ORDER BY COUNT(id) DESC
LIMIT 1;