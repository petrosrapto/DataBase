/* =====================
		QUERY 6
======================*/

SELECT r.res_id, r.first_name, r.last_name, floor(DATEDIFF(current_date(), r.date_of_birth) / 365.25) AS age, count(*) AS total_projects FROM researcher r 
INNER JOIN works w 
ON r.res_id = w.res_id 
INNER JOIN project p 
ON w.proj_id = p.proj_id 
WHERE floor(DATEDIFF(current_date(), r.date_of_birth) / 365.25) <= 40 AND (p.start <= current_date() AND p.end >= current_date())
GROUP BY r.res_id
ORDER BY count(*) DESC;