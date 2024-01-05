SELECT *,
    AVG(grade) OVER (PARTITION BY name, subject) AS avg_grade_per_student
FROM table_grades
QUALIFY ROW_NUMBER() OVER (PARTITION BY name, subject ORDER BY test_date DESC) = 1;