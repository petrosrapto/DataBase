/* =====================
		QUERY 5
======================*/

SELECT DISTINCT project_field.field_name AS first_field_name, dupl.field_name AS second_field_name, count(*) AS Popularity FROM 
(SELECT rf.field_name, pf.proj_id FROM research_field rf
 INNER JOIN proj_field pf
 ON rf.field_id = pf.field_id)  project_field
INNER JOIN
(SELECT rf.field_name, pf.proj_id FROM research_field rf  /* Reused.... */
 INNER JOIN proj_field pf
 ON rf.field_id = pf.field_id) dupl
ON project_field.proj_id = dupl.proj_id
WHERE project_field.field_name < dupl.field_name  /* Skipping Duplicates */
GROUP BY project_field.field_name, dupl.field_name
ORDER BY Popularity DESC
LIMIT 3;