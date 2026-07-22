# Write your MySQL query statement below

SELECT ROUND(100 * SUM(CASE WHEN B.min_order_date = B.min_delivery_date THEN 1 ELSE 0 END)/COUNT(*), 2) AS immediate_percentage
FROM (
    SELECT MIN(order_date) AS min_order_date, MIN(customer_pref_delivery_date) AS min_delivery_date
    FROM Delivery
    GROUP BY customer_id
) B;