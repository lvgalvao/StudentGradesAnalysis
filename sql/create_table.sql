INSTALL spatial;
LOAD spatial;
SELECT * FROM st_read('./data/grades.xlsx');
CREATE TABLE table_grades AS SELECT * FROM st_read('./data/grades.xlsx');
SELECT * FROM table_grades;