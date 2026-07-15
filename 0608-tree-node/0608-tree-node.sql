# Write your MySQL query statement below

SELECT DISTINCT P.id,
(
    CASE
        WHEN P.p_id IS NULL THEN 'Root'
        WHEN P.p_id IS NOT NULL AND C.p_id IS NOT NULL THEN 'Inner'
        WHEN P.p_id IS NOT NULL AND C.p_id IS NULL THEN 'Leaf'
    END
) AS type
FROM Tree AS P
LEFT JOIN Tree AS C
ON (P.id = C.p_id);