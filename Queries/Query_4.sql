/* =====================
		QUERY 4
======================*/

SELECT i.ins_id, i.abbreviation, i.name, i.year AS firts_year, j.year AS second_year, i.projects AS projects_each_year FROM projects_per_institution_per_year i
INNER JOIN projects_per_institution_per_year j
ON i.ins_id = j.ins_id 
WHERE i.year = j.year - 1 AND i.projects = j.projects AND i.projects >= 10;  