# Write your MySQL query statement below

SELECT product_id, COALESCE((
    SELECT new_price
    FROM Products P1
    WHERE P.product_id = P1.product_id
    AND P1.change_date <= '2019-08-16'
    ORDER BY P1.change_date DESC
    LIMIT 1
), 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) P;