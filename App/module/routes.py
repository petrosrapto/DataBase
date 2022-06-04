from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from module import app, db ## initially created by __init__.py, need to be used here
from module.forms import ProgramForm, ProjectForm, FieldForm, InstitutionForm, ProjectUpdateForm, ResearcherUpdateForm, ProjectCreateForm

@app.route("/")
def index():

    try:
        ## create connection to database
        cur = db.connection.cursor()
        ## execute query
        query = "WITH pf (field_name, field_id, proj_id) AS \
        (SELECT rf.field_name, rf.field_id, pf.proj_id FROM research_field rf \
         INNER JOIN proj_field pf ON rf.field_id = pf.field_id) \
        SELECT pf1.field_name AS field1, pf2.field_name AS field2, count(*) AS popularity \
        FROM pf pf1 INNER JOIN pf pf2 ON pf1.proj_id = pf2.proj_id \
        WHERE pf1.field_id < pf2.field_id \
        GROUP BY pf1.field_name, pf2.field_name \
        ORDER BY popularity DESC LIMIT 3;"
        cur.execute(query)
        ## cursor.fetchone() does not return the column names, only the row values
        ## thus we manually create a mapping between the two, the dictionary res
        column_names = [i[0] for i in cur.description]
        topFields = [dict(zip(column_names, entry)) for entry in cur.fetchall()]

        query = "SELECT e.name AS executive_name, i.name AS company_name, sum(p.fund) AS total_fund \
        FROM executive e INNER JOIN project p ON e.ex_id = p.ex_id \
        INNER JOIN institution i ON p.ins_id = i.ins_id \
        INNER JOIN company c ON i.ins_id = c.ins_id \
        GROUP BY e.ex_id, c.ins_id \
        ORDER BY sum(p.fund) DESC LIMIT 5;"
        cur.execute(query)
        ## cursor.fetchone() does not return the column names, only the row values
        ## thus we manually create a mapping between the two, the dictionary res
        column_names = [i[0] for i in cur.description]
        topExec = [dict(zip(column_names, entry)) for entry in cur.fetchall()]

        query = "SELECT r.first_name, r.last_name, floor(DATEDIFF(current_date(), r.date_of_birth) / 365.25) AS age, \
        count(*) AS total_projects FROM researcher r \
        INNER JOIN works w ON r.res_id = w.res_id \
        INNER JOIN project p ON w.proj_id = p.proj_id \
        WHERE floor(DATEDIFF(current_date(), r.date_of_birth) / 365.25) <= 40 AND (p.start <= current_date() AND p.end >= current_date()) \
        GROUP BY r.res_id ORDER BY count(*) DESC LIMIT 10;"
        cur.execute(query)
        ## cursor.fetchone() does not return the column names, only the row values
        ## thus we manually create a mapping between the two, the dictionary res
        column_names = [i[0] for i in cur.description]
        topRes = [dict(zip(column_names, entry)) for entry in cur.fetchall()]

        cur.close()
        return render_template("landing.html", pageTitle = "Home Page", topFields = topFields, topExec = topExec, topRes = topRes)
    except Exception as e:
        print(e)
        return render_template("landing.html", pageTitle = "Home Page")

@app.route("/programs")
def getPrograms():
    """
    Retrieve programs from database
    """
    try:
        form = ProgramForm()
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM program;")
        column_names = [i[0] for i in cur.description]
        programs = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("programs.html", programs = programs, pageTitle = "Programs Page", form = form)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.route("/create", methods = ["GET", "POST"]) ## "GET" by default
def create():
    """
    Create new entities in the database
    """
    programForm = ProgramForm()
    fieldForm = FieldForm()
    institutionForm = InstitutionForm()
    researcherForm = ResearcherUpdateForm()
    # find choices
    try:
        query = "SELECT ins_id FROM institution ORDER BY ins_id;"
        cur = db.connection.cursor()
        cur.execute(query)
        researcherForm.ins_id.choices = [(0,"Select Institution's ID"), *[list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]]
        cur.close()
    except Exception as e: ## OperationalError
        flash("Error while processing your last request: " + str(e.args[1]), "danger")

    projectForm = ProjectCreateForm()
    try:
        # find choices
        cur = db.connection.cursor()

        cur.execute("SELECT ins_id FROM institution ORDER BY ins_id;")
        projectForm.projectForm_ins_id.choices = [(0,"Select Institution's ID"), *[list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]]

        cur.execute("SELECT prog_id FROM program ORDER BY prog_id;")
        projectForm.prog_id.choices = [(0,"Select Program's ID"), *[list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]]

        cur.execute("SELECT ex_id FROM executive ORDER BY ex_id;")
        projectForm.ex_id.choices = [(0,"Select Executive's ID"), *[list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]]

        cur.execute("SELECT res_id FROM researcher ORDER BY res_id;")
        projectForm.ass_res_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]
        projectForm.sup_res_id.choices = [(0,"Select supervisor's ID"), *projectForm.ass_res_id.choices]
        projectForm.ass_res_id.choices = [(0,"Select assessor's ID"), *projectForm.ass_res_id.choices]

        cur.close()
    except Exception as e: ## OperationalError
        flash("Error while processing your last request: " + str(e.args[1]), "danger")

    ## when the form is submitted
    if(request.method == "POST" and programForm.validate_on_submit()):
        newProgram = programForm.__dict__
        query = "INSERT INTO program(name, department) VALUES ('{}', '{}');".format(newProgram['name'].data, newProgram['department'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Program inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash("Error while processing your last request: " + str(e.args[1]), "danger")

    if(request.method == "POST" and fieldForm.validate_on_submit()):
        newField = fieldForm.__dict__
        query = "INSERT INTO research_field(field_name, description) VALUES ('{}', '{}');".format(newField['field_name'].data, newField['description'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Research Field inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash("Error while processing your last request: " + str(e.args[1]), "danger")

    if(request.method == "POST" and institutionForm.validate_on_submit()):
        newInstitution = institutionForm.__dict__
        query = "INSERT INTO institution(abbreviation, name, street_name, street_number, zip, city) VALUES ('{}', '{}', '{}', '{}', '{}', '{}');\
        ".format(newInstitution['abbreviation'].data, newInstitution['name'].data, newInstitution['street_name'].data, newInstitution['street_number'].data, \
        newInstitution['zip'].data, newInstitution['city'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Institution inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash("Error while processing your last request: " + str(e.args[1]), "danger")

    if(request.method == "POST" and researcherForm.validate_on_submit()):
        newResearcher = researcherForm.__dict__
        query = "INSERT INTO researcher(first_name, last_name, sex, date_of_birth, ins_id, res_ins_date) VALUES ('{}', '{}', '{}', '{}', '{}', '{}');\
        ".format(newResearcher['first_name'].data, newResearcher['last_name'].data, newResearcher['sex'].data, newResearcher['date_of_birth'].data, \
        newResearcher['ins_id'].data, newResearcher['res_ins_date'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Researcher inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash("Error while processing your last request: " + str(e.args[1]), "danger")

    if(request.method == "POST" and projectForm.validate_on_submit()):
        newProject = projectForm.__dict__
        query1 = "INSERT INTO assessment(date, grade) VALUES ('{}', '{}');\
        ".format(newProject['ass_date'].data, newProject['ass_grade'].data)
        query2 = "SELECT LAST_INSERT_ID();"
        try:
            cur = db.connection.cursor()
            cur.execute(query1)
            db.connection.commit()
            cur.execute(query2)
            assID = cur.fetchall()

            query3 = "INSERT INTO project(title, description, start, end, fund, ins_id, prog_id, ex_id, ass_id, ass_res_id, sup_res_id) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');\
            ".format(newProject['projectForm_title'].data, newProject['projectForm_description'].data, newProject['start'].data, newProject['end'].data, \
            newProject['fund'].data, newProject['projectForm_ins_id'].data, newProject['prog_id'].data, newProject['ex_id'].data, assID[0][0], \
            newProject['ass_res_id'].data, newProject['sup_res_id'].data)

            cur.execute(query3)
            db.connection.commit()
            cur.close()
            flash("Project inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash("Error while processing your last request: " + str(e.args[1]), "danger")
            return redirect(url_for("index"))

    ## else, response for GET request
    return render_template("create.html", pageTitle = "Create Page", programForm = programForm, fieldForm = fieldForm, institutionForm = institutionForm, researcherForm = researcherForm, projectForm = projectForm)

@app.route("/programs/update/<int:programID>", methods = ["POST"])
def updateProgram(programID):
    """
    Update a program in the database, by id
    """
    form = ProgramForm()
    updateData = form.__dict__
    if(form.validate_on_submit()):
        query = "UPDATE program SET name = '{}', department = '{}' WHERE prog_id = {};".format(updateData['name'].data, updateData['department'].data, programID)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Program updated successfully", "success")
        except Exception as e:
            flash("Error while processing your last request: " + str(e.args[1]), "danger")
    else:
        for category in form.errors.values():
            for error in category:
                flash(error, "danger")
    return redirect(url_for("getPrograms"))

@app.route("/programs/delete/<int:programID>", methods = ["POST"])
def deleteProgram(programID):
    """
    Delete program by id from database
    """
    query = f"DELETE FROM program WHERE prog_id = {programID};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Program deleted successfully", "primary")
    except Exception as e:
        flash("Error while processing your last request: " + str(e.args[1]), "danger")
    return redirect(url_for("getPrograms"))

@app.route("/projects", methods = ["GET", "POST"])
def getProjects():
    """
    Retrieve projects from database
    """
    form = ProjectForm()
    updateForm = ProjectUpdateForm()
    # find choices
    cur = db.connection.cursor()

    cur.execute("SELECT ins_id FROM institution ORDER BY ins_id;")
    updateForm.projectForm_ins_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]

    cur.execute("SELECT prog_id FROM program ORDER BY prog_id;")
    updateForm.prog_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]

    cur.execute("SELECT ex_id FROM executive ORDER BY ex_id;")
    updateForm.ex_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]

    cur.execute("SELECT ass_id FROM assessment ORDER BY ass_id;")
    updateForm.ass_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]

    cur.execute("SELECT res_id FROM researcher ORDER BY res_id;")
    updateForm.ass_res_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]
    updateForm.sup_res_id.choices = updateForm.ass_res_id.choices

    cur.close()

    if(request.method == "POST" and form.validate_on_submit()):
        if (form.clear.data):
            return redirect(url_for("getProjects"))
        query = "SELECT * FROM project p"
        try:
            searchProj = form.__dict__
            where = 0
            if (searchProj['exec_name'].data != ''):
                query += " INNER JOIN executive e ON p.ex_id = e.ex_id WHERE e.name = '{}'".format(searchProj['exec_name'].data)
                where = 1
            if (searchProj['start'].data != None):
                if (where == 1):
                    query += " AND p.start = '{}'".format(searchProj['start'].data)
                else:
                    query += " WHERE p.start = '{}'".format(searchProj['start'].data)
                    where = 1
            if (searchProj['end'].data != None):
                if (where == 1):
                    query += " AND p.end = '{}'".format(searchProj['end'].data)
                else:
                    query += " WHERE p.end = '{}'".format(searchProj['end'].data)
                    where = 1
            if (searchProj['duration'].data != 'def'):
                if (where == 1):
                    query += " AND duration(p.start, p.end) = {}".format(searchProj['duration'].data)
                else:
                    query += " WHERE duration(p.start, p.end) = {}".format(searchProj['duration'].data)
                    where = 1
            query += ";"
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            projects = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()
            return render_template("projects.html", projects = projects, pageTitle = "Projects Page", form = form, updateForm = updateForm)
        except Exception as e:
            abort(500)
            print(e)
    try:
        query=request.args.get('listOfObjects') # argument from getProjectsFromField
        if (query == None):
            query = "SELECT * FROM project"
        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        projects = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("projects.html", projects = projects, pageTitle = "Projects Page", form = form, updateForm = updateForm)
    except Exception as e:
        abort(500)
        print(e)

@app.route("/projects/update/<int:projectID>", methods = ["POST"])
def updateProject(projectID):
    """
    Update a project in the database, by id
    """
    updateForm = ProjectUpdateForm()
    try:
        # find choices
        cur = db.connection.cursor()

        cur.execute("SELECT ins_id FROM institution ORDER BY ins_id;")
        updateForm.projectForm_ins_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]

        cur.execute("SELECT prog_id FROM program ORDER BY prog_id;")
        updateForm.prog_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]

        cur.execute("SELECT ex_id FROM executive ORDER BY ex_id;")
        updateForm.ex_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]

        cur.execute("SELECT ass_id FROM assessment ORDER BY ass_id;")
        updateForm.ass_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]

        cur.execute("SELECT res_id FROM researcher ORDER BY res_id;")
        updateForm.ass_res_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]
        updateForm.sup_res_id.choices = updateForm.ass_res_id.choices

        cur.close()
    except Exception as e: ## OperationalError
        flash("Error while processing your last request: " + str(e.args[1]), "danger")

    updateData = updateForm.__dict__
    if(updateForm.validate_on_submit()):
        query = "UPDATE project SET title = '{}', description = '{}', start = '{}', end = '{}', \
        fund = '{}', ins_id = '{}', prog_id = '{}', ex_id = '{}', ass_id = '{}', ass_res_id = '{}', \
        sup_res_id = '{}' WHERE proj_id = {};".format(updateData['projectForm_title'].data, updateData['projectForm_description'].data, updateData['start'].data, \
        updateData['end'].data, updateData['fund'].data, updateData['projectForm_ins_id'].data, updateData['prog_id'].data, \
        updateData['ex_id'].data, updateData['ass_id'].data, updateData['ass_res_id'].data, updateData['sup_res_id'].data, projectID)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Project updated successfully", "success")
        except Exception as e:
            flash("Error while processing your last request: " + str(e.args[1]), "danger")
    else:
        for category in updateForm.errors.values():
            for error in category:
                flash(error, "danger")
    return redirect(url_for("getProjects"))

@app.route("/projects/delete/<int:projectID>", methods = ["POST"])
def deleteProject(projectID):
    """
    Delete project by id from database
    """
    query = f"DELETE FROM project WHERE proj_id = {projectID};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Project deleted successfully", "primary")
    except Exception as e:
        flash("Error while processing your last request: " + str(e.args[1]), "danger")
    return redirect(url_for("getProjects"))

@app.route("/projects/researchers/<int:projectID>", methods = ["GET"]) ## "GET" by default
def getResearchersFromProject(projectID):
    """
    Show researchers
    """
    updateForm = ResearcherUpdateForm()
    query = f"SELECT DISTINCT * FROM project p INNER JOIN works w on w.proj_id = p.proj_id \
    INNER JOIN researcher r ON r.res_id = w.res_id WHERE p.proj_id = {projectID} \
    ORDER BY r.res_id;"
    try:
        """
        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        researchers = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("researchers.html", researchers = researchers, pageTitle = "Researchers Page", updateForm = updateForm)
        """
        return redirect(url_for('getResearchers', query=query))
    except Exception as e:
        abort(500)
        print(e)

@app.route("/fields")
def getFields():
    """
    Retrieve fields from database
    """
    try:
        form = FieldForm()
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM research_field;")
        column_names = [i[0] for i in cur.description]
        fields = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("fields.html", fields = fields, pageTitle = "Research Fields Page", form = form)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.route("/fields/update/<int:fieldID>", methods = ["POST"])
def updateField(fieldID):
    """
    Update a field in the database, by id
    """
    form = FieldForm()
    updateData = form.__dict__
    if(form.validate_on_submit()):
        query = "UPDATE research_field SET field_name = '{}', description = '{}' WHERE field_id = {};".format(updateData['field_name'].data, updateData['description'].data, fieldID)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Field updated successfully", "success")
        except Exception as e:
            flash("Error while processing your last request: " + str(e.args[1]), "danger")
    else:
        for category in form.errors.values():
            for error in category:
                flash(error, "danger")
    return redirect(url_for("getFields"))

@app.route("/fields/projects/<int:fieldID>", methods = ["GET"]) ## "GET" by default
def getProjectsFromField(fieldID):
    """
    Show Projects
    """
    query = f"SELECT DISTINCT p.proj_id, p.title, p.description, p.start, p.end, p.fund, \
    p.ins_id, p.prog_id, p.ex_id, p.ass_id, p.ass_res_id, p.sup_res_id \
    FROM research_field rf \
    INNER JOIN proj_field pf ON rf.field_id = pf.field_id \
    INNER JOIN project p ON pf.proj_id = p.proj_id \
    WHERE rf.field_id = {fieldID} AND p.start <= current_date()  AND p.end >= current_date() \
    ORDER BY p.proj_id;"
    try:
        return redirect(url_for('getProjects', listOfObjects=query))
    except Exception as e:
        abort(500)
        print(e)

@app.route("/fields/researchers/<int:fieldID>", methods = ["GET"]) ## "GET" by default
def getResearchersFromField(fieldID):
    """
    Show Researchers
    """
    updateForm = ResearcherUpdateForm()
    query = f"SELECT DISTINCT r.res_id, r.first_name, r.last_name, r.sex, r.date_of_birth, \
    r.ins_id, r.res_ins_date \
    FROM research_field rf \
    INNER JOIN proj_field pf ON rf.field_id = pf.field_id \
    INNER JOIN project p ON pf.proj_id = p.proj_id \
    INNER JOIN works w ON p.proj_id = w.proj_id \
    INNER JOIN researcher r ON w.res_id = r.res_id \
    WHERE rf.field_id = {fieldID} AND p.start <= current_date() AND p.end >= DATE_SUB(current_date(), INTERVAL 1 YEAR) \
    ORDER BY r.res_id;"
    try:
        """
        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        researchers = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("researchers.html", researchers = researchers, pageTitle = "Researchers Page", updateForm = updateForm)
        """
        return redirect(url_for('getResearchers', query=query))
    except Exception as e:
        abort(500)
        print(e)

@app.route("/institutions")
def getInstitutions():
    """
    Retrieve institutions from database
    """
    try:
        form = InstitutionForm()
        btnPressed=request.args.get('listOfObjects') # argument from button pressed
        if (btnPressed == None):
            query = "SELECT i.ins_id, i.abbreviation, i.name, \
            i.street_name, i.street_number, i.city, i.zip \
            FROM institution i;"
        elif (btnPressed == 'pressed_2'):
            query = "SELECT i.ins_id, i.abbreviation, i.name, \
            i.year AS first_year, j.year AS second_year, i.projects AS projects_each_year \
            FROM projects_per_institution_per_year i INNER JOIN projects_per_institution_per_year j\
            ON i.ins_id = j.ins_id WHERE i.year = j.year - 1 AND i.projects = j.projects AND i.projects >= 10;"
        else:
            query = "SELECT * FROM projects_per_institution_per_year ORDER BY ins_id, year;"

        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        institutions = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("institutions.html", institutions = institutions, pageTitle = "Institutions Page", form = form)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.route("/institutions/update/<int:institutionID>", methods = ["POST"])
def updateInstitution(institutionID):
    """
    Update a institution in the database, by id
    """
    form = InstitutionForm()
    updateData = form.__dict__
    if(form.validate_on_submit()):
        query = "UPDATE institution SET abbreviation = '{}', name = '{}', street_name = '{}', street_number = '{}', \
        zip = '{}', city = '{}' WHERE ins_id = {};".format(updateData['abbreviation'].data, updateData['name'].data, \
        updateData['street_name'].data, updateData['street_number'].data, updateData['zip'].data, updateData['city'].data, institutionID)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Institution updated successfully", "success")
        except Exception as e:
            flash("Error while processing your last request: " + str(e.args[1]), "danger")
    else:
        for category in form.errors.values():
            for error in category:
                flash(error, "danger")
    return redirect(url_for("getInstitutions"))

@app.route("/institutions/delete/<int:institutionID>", methods = ["POST"])
def deleteInstitution(institutionID):
    """
    Delete institution by id from database
    """
    query = f"DELETE FROM institution WHERE ins_id = {institutionID};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Institution deleted successfully", "primary")
    except Exception as e:
        flash("Error while processing your last request: " + str(e.args[1]), "danger")
    return redirect(url_for("getInstitutions"))

@app.route("/researchers")
def getResearchers():
    """
    Retrieve Researchers from database
    """
    try:
        updateForm = ResearcherUpdateForm()
        try:
            # find choices
            query = "SELECT ins_id FROM institution ORDER BY ins_id;"
            cur = db.connection.cursor()
            cur.execute(query)
            updateForm.ins_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]
            cur.close()
        except Exception as e:
            flash("Error while processing your last request: " + str(e.args[1]), "danger")
        btnPressed=request.args.get('listOfObjects') # argument from button pressed
        queryArgument = request.args.get('query')
        if (queryArgument != None):
            query = queryArgument
        elif (btnPressed == None):
            # find choices
            query = "SELECT ins_id FROM institution ORDER BY ins_id;"
            cur = db.connection.cursor()
            cur.execute(query)
            updateForm.ins_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]
            cur.close()
            query = "SELECT r.res_id, r.first_name, r.last_name, r.sex, r.date_of_birth, r.ins_id, r.res_ins_date FROM researcher r;"
        elif (btnPressed == 'pressed_2'):
            query = "SELECT r.res_id, r.first_name, r.last_name, count(*) AS num_of_projects \
            FROM researcher r INNER JOIN works w ON r.res_id = w.res_id \
            INNER JOIN (SELECT * FROM project \
            WHERE proj_id not in (SELECT proj_id FROM deliverable)) p \
            ON w.proj_id = p.proj_id \
            WHERE p.start <= current_date()  AND p.end >= current_date() \
            GROUP BY r.res_id HAVING count(*) >= 5 ORDER BY num_of_projects DESC;"
        else:
            query = "SELECT * FROM projects_per_researcher ORDER BY res_id;"

        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        researchers = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("researchers.html", researchers = researchers, pageTitle = "Researchers Page", updateForm = updateForm)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.route("/researchers/update/<int:researcherID>", methods = ["POST"])
def updateResearcher(researcherID):
    """
    Update a researcher in the database, by id
    """
    updateForm = ResearcherUpdateForm()
    try:
        # find choices
        query = "SELECT ins_id FROM institution ORDER BY ins_id;"
        cur = db.connection.cursor()
        cur.execute(query)
        updateForm.ins_id.choices = [list(dict(zip(entry, entry)).items())[0] for entry in cur.fetchall()]
        cur.close()
    except Exception as e:
        flash("Error while processing your last request: " + str(e.args[1]), "danger")
    updateData = updateForm.__dict__
    if(updateForm.validate_on_submit()):
        query = "UPDATE researcher SET first_name = '{}', last_name = '{}', sex = '{}', \
        date_of_birth = '{}', ins_id = '{}', res_ins_date = '{}' WHERE res_id = {};".format(updateData['first_name'].data, updateData['last_name'].data, \
        updateData['sex'].data, updateData['date_of_birth'].data, updateData['ins_id'].data, updateData['res_ins_date'].data, researcherID)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Researcher updated successfully", "success")
        except Exception as e:
            flash("Error while processing your last request: " + str(e.args[1]), "danger")
    else:
        for category in updateForm.errors.values():
            for error in category:
                flash(error, "danger")
    return redirect(url_for("getResearchers"))

@app.route("/researchers/delete/<int:researcherID>", methods = ["POST"])
def deleteResearcher(researcherID):
    """
    Delete researcher by id from database
    """
    query = f"DELETE FROM researcher WHERE res_id = {researcherID};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Researcher deleted successfully", "primary")
    except Exception as e:
        flash("Error while processing your last request: " + str(e.args[1]), "danger")
    return redirect(url_for("getResearchers"))

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500
