CREATE TEMPORARY VIEW view_avg_grade AS
SELECT
    name,
    subject,
    avg(grade) AS avg_grade
FROM table_grades
GROUP BY name, subject
ORDER BY name, subject;