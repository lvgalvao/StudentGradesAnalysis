COPY (SELECT * FROM view_last_test_date_with_avg_grade) TO './data/output.csv' (DELIMITER ',', HEADER);
