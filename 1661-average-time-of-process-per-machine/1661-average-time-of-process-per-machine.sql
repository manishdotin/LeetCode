# Write your MySQL query statement below

SELECT machine_id, ROUND(AVG(time_lapse), 3) AS processing_time
FROM (
    SELECT machine_id, process_id, MAX(timestamp) OVER (PARTITION BY machine_id, process_id) - MIN(timestamp) OVER (PARTITION BY machine_id, process_id)AS time_lapse
    FROM Activity
    ) temp
GROUP BY machine_id;