# Write your MySQL query statement below

SELECT T.request_at AS Day, ROUND(AVG(T.status != "completed"), 2) AS 'Cancellation Rate'
FROM Trips T
JOIN Users U1 ON T.driver_id = U1.users_id
JOIN Users U2 ON T.client_id = U2.users_id
WHERE U1.banned = "No"
AND U2.banned = "No"
AND request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY request_at
ORDER BY request_at;
