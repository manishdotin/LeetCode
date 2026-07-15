# Write your MySQL query statement below

SELECT S.name
FROM SalesPerson AS S
LEFT JOIN Orders USING (sales_id)
LEFT JOIN Company AS C USING (com_id)
GROUP BY sales_id
HAVING IFNULL(SUM(C.name = 'RED'), 0) = 0;