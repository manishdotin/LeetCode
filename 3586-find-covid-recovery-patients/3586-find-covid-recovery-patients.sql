# Write your MySQL query statement below

WITH first_positive AS (
    SELECT patient_id, MIN(test_date) AS first_positive_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
),
first_negative_after_positive AS (
    SELECT T.patient_id, MIN(T.test_date) AS first_negative_date
    FROM covid_tests T
    JOIN first_positive P ON T.patient_id = P.patient_id AND T.test_date > P.first_positive_date
    WHERE T.result = 'Negative'
    GROUP BY T.patient_id
)
SELECT P.patient_id, P.patient_name, P.age, DATEDIFF(N.first_negative_date, F.first_positive_date) AS recovery_time
FROM first_positive F
JOIN first_negative_after_positive N ON F.patient_id = N.patient_id
JOIN patients P ON p.patient_id = F.patient_id
ORDER BY recovery_time ASC, patient_name ASC;