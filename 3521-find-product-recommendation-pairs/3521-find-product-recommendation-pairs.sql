# Write your MySQL query statement below

SELECT P1.product_id AS product1_id, P2.product_id AS product2_id, I1.category AS product1_category, I2.category AS product2_category, COUNT(P1.user_id) AS customer_count
FROM ProductPurchases P1
JOIN ProductPurchases P2 ON P1.user_id = P2.user_id
AND P1.product_id < P2.product_id
JOIN ProductInfo I1 ON (P1.product_id = I1.product_id)
JOIN ProductInfo I2 ON (P2.product_id = I2.product_id)
GROUP BY P1.product_id, P2.product_id, I1.category, I2.category
HAVING COUNT(DISTINCT P1.user_id) >= 3
ORDER BY customer_count DESC, product1_id ASC, product2_id ASC;