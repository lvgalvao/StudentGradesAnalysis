CREATE VIEW view_last_test_date_with_avg_grade AS
SELECT 
    a.name,
    a.subject,
    last_test_date,
    last_grade,
    avg_grade
FROM view_last_test_date a
JOIN view_avg_grade b ON (a.name = b.name AND a.subject = b.subject);

CREATE TEMPORARY VIEW view_avg_grade AS
SELECT
    name,
    subject,
    avg(grade) AS avg_grade
FROM table_grades
GROUP BY name, subject
ORDER BY name, subject;

CREATE VIEW view_last_test_date AS
SELECT
    name,
    subject,
    test_date AS last_test_date,
    grade AS last_grade
FROM (
    SELECT
        name,
        subject,
        test_date,
        grade,
        ROW_NUMBER() OVER (PARTITION BY name, subject ORDER BY test_date DESC) AS rn
    FROM table_grades
) AS ranked_grades
WHERE rn = 1;