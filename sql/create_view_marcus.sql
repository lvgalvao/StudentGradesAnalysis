WITH UltimaAvaliacao AS (
 SELECT
 name,
 subject,
 test_date,
 grade,
 ROW_NUMBER() OVER (PARTITION BY name, subject ORDER BY test_date DESC) AS rn
 FROM
 table_grades
),
MediasPorMateria AS (
 SELECT
 subject,
 AVG(grade) AS media_materia
 FROM
 table_grades
 GROUP BY subject
)
SELECT
 UA.name, 
 UA.subject,
 UA.test_date,
 UA.grade,
 MMP.media_materia
FROM
 UltimaAvaliacao UA
JOIN
 MediasPorMateria MMP ON UA.subject = MMP.subject
WHERE
 UA.rn = 1;