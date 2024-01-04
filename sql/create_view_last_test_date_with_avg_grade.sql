CREATE VIEW view_last_test_date_with_avg_grade AS
SELECT 
    a.name,
    a.subject,
    last_test_date,
    last_grade,
    avg_grade
FROM view_last_test_date a
JOIN view_avg_grade b ON (a.name = b.name AND a.subject = b.subject);