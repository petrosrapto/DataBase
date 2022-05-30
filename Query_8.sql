/* =====================
		QUERY 8
======================*/

SELECT r.first_name, r.last_name, count(*) AS num_of_projects FROM researcher r 
INNER JOIN works w
ON r.res_id = w.res_id
INNER JOIN 
(SELECT * FROM project 
 WHERE proj_id not in (SELECT proj_id FROM deliverable)) p 
ON w.proj_id = p.proj_id
WHERE p.start <= current_date()  AND p.end >= current_date()
GROUP BY r.res_id
HAVING count(*) >= 5
ORDER BY num_of_projects DESC;