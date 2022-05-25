from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired, Email

## when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
## with the additional restrictions specified for each field
class ProgramForm(FlaskForm):
    name = StringField(label = "name", validators = [DataRequired(message = "Name is a required field.")])

    department = StringField(label = "department", validators = [DataRequired(message = "Department is a required field.")])

    submit = SubmitField("Create")
