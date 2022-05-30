/* Creating indexes on foreign key columns (very helpfull when updating data) */

CREATE INDEX idx_res_ins_id ON researcher(ins_id);
CREATE INDEX idx_proj_ins_id ON project(ins_id);
CREATE INDEX idx_prog_id ON project(prog_id);
CREATE INDEX idx_ex_id ON project(ex_id);
CREATE UNIQUE INDEX idx_ass_id ON project(ass_id);
CREATE INDEX idx_ass_res_id ON project(ass_res_id);
CREATE INDEX idx_sup_res_id ON project(sup_res_id);

/* Indexes on columns that will frequently be used to retrieve data (used in certain Queries) */

CREATE INDEX idx_start_date ON project(start); /* Used on multiple Queries */
CREATE INDEX idx_end_date ON project(end); /* Used on multiple Queries */
CREATE INDEX idx_date_of_birth ON researcher(date_of_birth) /* Used on Query 6 */