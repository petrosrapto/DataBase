/* =====================
		QUERY 3
======================*/

SELECT p.proj_id, p.title, p.description, p.start, p.end, p.fund, p.ins_id, p.prog_id, p.ex_id, p.ass_id, p.ass_res_id, p.sup_res_id FROM research_field rf 
INNER JOIN proj_field pf
ON rf.field_id = pf.field_id
INNER JOIN project p
ON pf.proj_id = p.proj_id 
WHERE rf.field_id = 99012 AND p.start <= current_date()  AND p.end >= current_date(); /* User picked field_id on app*/

SELECT DISTINCT r.res_id, r.first_name, r.last_name, r.sex, r.date_of_birth, r.ins_id, r.res_ins_date FROM research_field rf 
INNER JOIN proj_field pf
ON rf.field_id = pf.field_id
INNER JOIN project p
ON pf.proj_id = p.proj_id 
INNER JOIN works w 
ON p.proj_id = w.proj_id 
INNER JOIN researcher r 
ON w.res_id = r.res_id 
WHERE rf.field_id = 99012 AND (p.start <= current_date() AND p.end >= DATE_SUB(current_date(), INTERVAL 1 YEAR)); /* User picked field_id on app*/
