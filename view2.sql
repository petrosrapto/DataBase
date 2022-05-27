/* View of projects per institution per year (used in Query_4) */

CREATE VIEW projects_per_institution_per_year
(ins_id, name, projects, year)
 AS
 SELECT i.ins_id, i.name, count(*), YEAR(p.start) as year FROM institution i
 INNER JOIN project p
 ON i.ins_id = p.ins_id
 GROUP BY i.ins_id, year;