# Write your MySQL query statement below

SELECT S.user_id, IFNULL(ROUND(AVG(C.action = 'confirmed'), 2), 0) AS confirmation_rate
FROM Signups S
LEFT JOIN Confirmations C ON S.user_id = C.user_id
GROUP BY 1;