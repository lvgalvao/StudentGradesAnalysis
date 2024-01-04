SELECT *,
    AVG(grade) OVER (PARTITION BY subject) AS med_subject
FROM table_grades
QUALIFY ROW_NUMBER() OVER (PARTITION BY name, subject ORDER BY test_date DESC) = 1;