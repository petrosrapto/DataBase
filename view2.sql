/* View of projects per institution(Dummy) */

CREATE VIEW projects_per_institution
(ins_id, name, total_projects)
 AS
 SELECT i.ins_id, i.name, count(*) FROM institution i
 INNER JOIN project p
 ON i.ins_id = p.ins_id
 GROUP BY i.ins_id
