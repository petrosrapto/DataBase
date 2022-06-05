/* =====================
		QUERY 5
======================*/

WITH pf (field_name, field_id, proj_id) AS 
(SELECT rf.field_name, rf.field_id, pf.proj_id FROM research_field rf 
 INNER JOIN proj_field pf 
 ON rf.field_id = pf.field_id) 
SELECT pf1.field_name AS field1, pf2.field_name AS field2, count(*) AS popularity FROM pf pf1 
INNER JOIN pf pf2 
ON pf1.proj_id = pf2.proj_id 
WHERE pf1.field_id < pf2.field_id 
GROUP BY pf1.field_name, pf2.field_name 
ORDER BY popularity DESC LIMIT 3;