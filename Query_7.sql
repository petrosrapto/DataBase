/* =====================
		QUERY 7
======================*/

SELECT e.name AS executive_name, i.name AS company_name, sum(p.fund) AS total_fund FROM executive e
INNER JOIN project p 
ON e.ex_id = p.ex_id 
INNER JOIN institution i 
ON p.ins_id = i.ins_id 
INNER JOIN company c 
ON i.ins_id = c.ins_id 
GROUP BY e.ex_id, c.ins_id 
ORDER BY sum(p.fund) DESC
LIMIT 5;