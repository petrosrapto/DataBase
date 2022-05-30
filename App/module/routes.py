from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from module import app, db ## initially created by __init__.py, need to be used here
from module.forms import ProgramForm, ProjectForm

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
        cur.close()
        return render_template("landing.html", pageTitle = "Home Page", topFields = topFields, topExec = topExec)
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

@app.route("/programs/create", methods = ["GET", "POST"]) ## "GET" by default
def createProgram():
    """
    Create new program in the database
    """
    form = ProgramForm()
    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        newProgram = form.__dict__
        query = "INSERT INTO program(name, department) VALUES ('{}', '{}');".format(newProgram['name'].data, newProgram['department'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Program inserted successfully", "success")
            return redirect(url_for("index"))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("create_program.html", pageTitle = "Create Program", form = form)

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
            flash(str(e), "danger")
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
        flash(str(e), "danger")
    return redirect(url_for("getPrograms"))

@app.route("/projects", methods = ["GET", "POST"])
def getProjects():
    """
    Retrieve projects from database
    """
    form = ProjectForm()
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
            return render_template("projects.html", projects = projects, pageTitle = "Projects Page", form = form)
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
        return render_template("projects.html", projects = projects, pageTitle = "Projects Page", form = form)
    except Exception as e:
        abort(500)
        print(e)

@app.route("/projects/researchers/<int:projectID>", methods = ["GET"]) ## "GET" by default
def getResearchersFromProject(projectID):
    """
    Show researchers
    """
    query = f"SELECT * FROM project p INNER JOIN works w on w.proj_id = p.proj_id \
    INNER JOIN researcher r ON r.res_id = w.res_id WHERE p.proj_id = {projectID};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        researchers = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("researchers.html", researchers = researchers, pageTitle = "Researchers Page")
    except Exception as e:
        abort(500)
        print(e)

@app.route("/fields")
def getFields():
    """
    Retrieve fields from database
    """
    try:
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM research_field;")
        column_names = [i[0] for i in cur.description]
        fields = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("fields.html", fields = fields, pageTitle = "Research Fields Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.route("/fields/projects/<int:fieldID>", methods = ["GET"]) ## "GET" by default
def getProjectsFromField(fieldID):
    """
    Show Projects
    """
    query = f"SELECT p.proj_id, p.title, p.description, p.start, p.end, p.fund \
    FROM research_field rf \
    INNER JOIN proj_field pf ON rf.field_id = pf.field_id \
    INNER JOIN project p ON pf.proj_id = p.proj_id \
    WHERE rf.field_id = {fieldID} AND p.start <= current_date()  AND p.end >= current_date();"
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
    query = f"SELECT r.res_id, r.first_name, r.last_name, r.sex, r.date_of_birth \
    FROM research_field rf \
    INNER JOIN proj_field pf ON rf.field_id = pf.field_id \
    INNER JOIN project p ON pf.proj_id = p.proj_id \
    INNER JOIN works w ON p.proj_id = w.proj_id \
    INNER JOIN researcher r ON w.res_id = r.res_id \
    WHERE rf.field_id = {fieldID} AND p.start <= current_date() AND p.end >= DATE_SUB(current_date(), INTERVAL 1 YEAR);"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        researchers = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("researchers.html", researchers = researchers, pageTitle = "Researchers Page")
    except Exception as e:
        abort(500)
        print(e)

@app.route("/institutions")
def getInstitutions():
    """
    Retrieve institutions from database
    """
    try:
        btnPressed=request.args.get('listOfObjects') # argument from button pressed
        if (btnPressed == None):
            query = "SELECT i.ins_id, i.abbreviation, i.name, \
            CONCAT(i.street_name,' ',i.street_number,', ',i.city,' ',i.zip) AS address \
            FROM institution i;"
        else:
            query = "SELECT i.ins_id, i.abbreviation, i.name, \
            i.year AS first_year, j.year AS second_year, i.projects AS projects_each_year \
            FROM projects_per_institution_per_year i INNER JOIN projects_per_institution_per_year j\
            ON i.ins_id = j.ins_id WHERE i.year = j.year - 1 AND i.projects = j.projects AND i.projects >= 10;"

            """ QUERY MUST CHANGE i.projects >= 10; """

        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        institutions = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("institutions.html", institutions = institutions, pageTitle = "Institutions Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.route("/researchers")
def getResearchers():
    """
    Retrieve Researchers from database
    """
    try:
        btnPressed=request.args.get('listOfObjects') # argument from button pressed
        if (btnPressed == None):
            query = "SELECT r.res_id, r.first_name, r.last_name, r.sex, r.date_of_birth FROM researcher r;"
        else:
            query = "SELECT r.res_id, r.first_name, r.last_name, count(*) AS num_of_projects \
            FROM researcher r INNER JOIN works w ON r.res_id = w.res_id \
            INNER JOIN (SELECT * FROM project \
            WHERE proj_id not in (SELECT proj_id FROM deliverable)) p \
            ON w.proj_id = p.proj_id \
            WHERE p.start <= current_date()  AND p.end >= current_date() \
            GROUP BY r.res_id HAVING count(*) >= 5 ORDER BY num_of_projects DESC;"

            """ QUERY MUST CHANGE HAVING count(*) >= 5"""

        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        researchers = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("researchers.html", researchers = researchers, pageTitle = "Researchers Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500
