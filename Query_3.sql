/* =====================
		QUERY 3
======================*/

SELECT rf.field_name, p.proj_id, p.title FROM research_field rf 
INNER JOIN proj_field pf
ON rf.field_id = pf.field_id
INNER JOIN project p
ON pf.proj_id = p.proj_id 
WHERE rf.field_name = 'Engineering' AND p.start <= current_date()  AND p.end >= current_date() 

SELECT rf.field_name, r.res_id, r.first_name, r.last_name FROM research_field rf 
INNER JOIN proj_field pf
ON rf.field_id = pf.field_id
INNER JOIN project p
ON pf.proj_id = p.proj_id 
INNER JOIN works w 
ON p.proj_id = w.proj_id 
INNER JOIN researcher r 
ON w.res_id = r.res_id 
WHERE rf.field_name = 'Engineering' AND (p.start <= current_date() AND p.end >= DATE_SUB(current_date(), INTERVAL 1 YEAR)) ) 
