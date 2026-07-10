# Write your MySQL query statement below

SELECT W1.id
FROM Weather AS W1
JOIN Weather AS W2 ON SUBDATE(W1.recordDate, 1) = W2.recordDate AND W1.temperature > W2.temperature;