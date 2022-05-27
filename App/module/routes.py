from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from module import app, db ## initially created by __init__.py, need to be used here
from module.forms import ProgramForm

@app.route("/")
def index():
    try:
        ## create connection to database
        cur = db.connection.cursor()
        ## execute query
        cur.execute("SELECT g.grade, s.name, s.surname FROM students s INNER JOIN grades g ON g.student_id = s.id WHERE g.course_name = 'DRI' ORDER BY g.grade DESC LIMIT 1")
        ## cursor.fetchone() does not return the column names, only the row values
        ## thus we manually create a mapping between the two, the dictionary res
        column_names = [i[0] for i in cur.description]
        res = dict(zip(column_names, cur.fetchone()))
        best_dribbling_grade = res.get("grade")
        best_dribbler = res.get("name") + " " + res.get("surname")

        cur.execute("SELECT g.grade, s.name, s.surname FROM students s INNER JOIN grades g ON g.student_id = s.id WHERE g.course_name = 'SHO' ORDER BY g.grade DESC LIMIT 1")
        res = dict(zip(column_names, cur.fetchone()))
        cur.close()
        best_shooting_grade = res.get("grade")
        best_shooter = res.get("name") + " " + res.get("surname")

        return render_template("landing.html",
                               pageTitle = "Landing Page",
                               best_dribbling_grade = best_dribbling_grade,
                               best_dribbler = best_dribbler,
                               best_shooting_grade = best_shooting_grade,
                               best_shooter = best_shooter)
    except Exception as e:
        print(e)
        return render_template("landing.html", pageTitle = "Landing Page")

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

# Fetch view projects_per_researcher (not updatable)
@app.route("/projects_per_researcher")
def getprojects_per_researcher():
    """
    Retrieve view projects_per_researcher from database
    """
    try:
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM projects_per_researcher;")
        column_names = [i[0] for i in cur.description]
        projects_per_researcher = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("projects_per_researcher.html", projects_per_researcher = projects_per_researcher, pageTitle = " Projects per researcher")
    except Exception as e:
        abort(500)
        print(e)
        
@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500
