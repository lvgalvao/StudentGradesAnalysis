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