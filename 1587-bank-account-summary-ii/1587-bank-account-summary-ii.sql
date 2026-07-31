# Write your MySQL query statement below

SELECT U.name, SUM(amount) AS balance
FROM Users U
INNER JOIN Transactions T ON U.account = T.account
GROUP BY 1
HAVING balance > 10000;