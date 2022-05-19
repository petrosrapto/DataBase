/* Creating indexes on foreign key columns */

CREATE INDEX idx_res_ins_id ON researcher(ins_id)
CREATE INDEX idx_works_res_id ON works(res_id)
CREATE INDEX idx_works_proj_id ON works(proj_id)
CREATE INDEX idx_proj_ins_id ON project(ins_id)
CREATE INDEX idx_prog_id ON project(prog_id)
CREATE INDEX idx_ex_id ON project(ex_id)
CREATE INDEX idx_ass_id ON project(ass_id)
CREATE INDEX idx_ass_res_id ON project(ass_res_id ) 
CREATE INDEX idx_sup_res_id ON project(sup_res_id)
CREATE INDEX idx_proj_field_proj_id ON proj_field(proj_id)
CREATE INDEX idx_del_proj_id ON deliverable(proj_id)

/* We may add indexes after creating certain Queries on columns that will frequently be used to retrieve data */
