# Write your MySQL query statement below

SELECT S.student_id, S.student_name, S1.subject_name, (SELECT COUNT(1)
                FROM Examinations
                WHERE student_id = S.student_id
                AND subject_name = S1.subject_name) AS attended_exams
FROM Students S
JOIN Subjects S1
ORDER BY S.student_id, S1.subject_name
