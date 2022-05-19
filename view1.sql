/* =====================
		QUERY 2
======================*/

/* View of projects per reasercher. Warning: View is not updatable */

CREATE VIEW projects_per_researcher
(res_id, first_name, last_name, total_projects)
 AS
 SELECT r.res_id, r.first_name, r.last_name, count(*) FROM researcher r
 INNER JOIN works w
 ON r.res_id = w.res_id
 INNER JOIN project p 
 ON w.proj_id = p.proj_id
 GROUP BY r.res_id
