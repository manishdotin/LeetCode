# Write your MySQL query statement below

WITH user_category AS (
    SELECT DISTINCT user_id, category
    FROM ProductPurchases
    JOIN ProductInfo USING (product_id)
),
pair_per_user AS (
    SELECT A.user_id, A.category    AS category1, B.category AS category2
    FROM user_category AS A
    JOIN user_category AS B ON A.user_id = B.user_id AND A.category < B.category
)
SELECT category1, category2, COUNT(DISTINCT user_id) AS customer_count
FROM pair_per_user
GROUP BY 1, 2
HAVING customer_count >= 3
ORDER BY 3 DESC, 1, 2;
