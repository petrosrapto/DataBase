/* =====================
		QUERY 4
======================*/

SELECT i.ins_id, i.name, i.year AS firts_year, dupl.year AS second_year, i.projects AS projects_each_year 
FROM projects_per_institution_per_year i, projects_per_institution_per_year dupl
WHERE i.ins_id = dupl.ins_id AND i.year = dupl.year - 1 AND i.projects = dupl.projects AND i.projects >= 10  