# Write your MySQL query statement below

SELECT ROUND(AVG(B.event_date IS NOT NULL), 2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY 1
) AS A
LEFT JOIN Activity AS B ON A.player_id = B.player_id AND DATEDIFF(a.event_date, b.event_date) = -1;