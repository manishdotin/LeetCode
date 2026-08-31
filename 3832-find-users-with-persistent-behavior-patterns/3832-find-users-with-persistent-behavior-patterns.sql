# Write your MySQL query statement below

WITH CTE1 AS (
    SELECT user_id
    FROM activity
    GROUP BY user_id
    HAVING COUNT(DISTINCT action_date) = COUNT(1)
),
CTE2 AS (
    SELECT user_id, action_date, action, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY action_date) AS rn
    FROM activity
    WHERE user_id IN (
        SELECT user_id
        FROM CTE1
    )
),
CTE3 AS (
    SELECT user_id, action_date, action, DATE_SUB(action_date, INTERVAL rn DAY) AS grp
    FROM CTE2
)
SELECT user_id, action, streak_length, start_date, end_date
FROM (
    SELECT user_id, action, COUNT(1) AS streak_length, MIN(action_date) AS start_date, MAX(action_date) AS end_date, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY COUNT(1) DESC) AS rn
    FROM CTE3
    GROUP BY user_id, action, grp
    HAVING streak_length >= 5
    )t
WHERE rn = 1
ORDER BY streak_length DESC, user_id;
