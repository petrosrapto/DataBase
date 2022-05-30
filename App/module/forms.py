from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, DateField, SelectField
from wtforms.validators import DataRequired, Email, Optional

## when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
## with the additional restrictions specified for each field
class ProgramForm(FlaskForm):
    name = StringField(label = "name", validators = [DataRequired(message = "Name is a required field.")])

    department = StringField(label = "department", validators = [DataRequired(message = "Department is a required field.")])

    submit = SubmitField("Create")

class ProjectForm(FlaskForm):
    exec_name = StringField(label = "Executive's Name", validators = [Optional()])
    start = DateField(label = "Project's Start Date", format='%Y-%m-%d', validators = [Optional()])
    end = DateField(label = "Project's End Date", format='%Y-%m-%d', validators = [Optional()])
    duration = SelectField("Project's Duration (Αpprox.)", default='def',choices=[('def', 'Select Duration'), ('1', 'One Year'), ('2', 'Two Years'), ('3', 'Three Years'), ('4', 'Four Years')])
    submit = SubmitField("Search")
    clear = SubmitField("Clear")
