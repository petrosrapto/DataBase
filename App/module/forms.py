from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, DateField, SelectField, IntegerField, DecimalField
from wtforms.validators import DataRequired, Email, Optional, Length, InputRequired, NumberRange, ValidationError

## when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
## with the additional restrictions specified for each field
class ProgramForm(FlaskForm):
    name = StringField(label = "Name", validators = [DataRequired(message = "Name is a required field.")])

    department = StringField(label = "Department", validators = [DataRequired(message = "Department is a required field.")])

    submit = SubmitField("Create")

class FieldForm(FlaskForm):
    field_name = StringField(label = "Name", validators = [DataRequired(message = "Name is a required field.")])

    description = StringField(label = "Description", validators = [DataRequired(message = "Description is a required field.")])

    submit = SubmitField("Create")

class InstitutionForm(FlaskForm):
    abbreviation = StringField(label = "Abbreviation", validators = [DataRequired(message = "Abbreviation is a required field.")])

    name = StringField(label = "Name", validators = [DataRequired(message = "Name is a required field.")])

    street_name = StringField(label = "Street Name", validators = [DataRequired(message = "Street Name is a required field.")])

    street_number = IntegerField(label = "Street Number", validators = [DataRequired(message = "Street Number is a required field.")])

    zip = IntegerField(label = "Zip", validators = [DataRequired(message = "Zip is a required field.")])

    city = StringField(label = "City", validators = [DataRequired(message = "City is a required field.")])

    submit = SubmitField("Create")

class ProjectForm(FlaskForm):
    exec_name = StringField(label = "Executive's Name", validators = [Optional()])
    start = DateField(label = "Project's Start Date", format='%Y-%m-%d', validators = [Optional()])
    end = DateField(label = "Project's End Date", format='%Y-%m-%d', validators = [Optional()])
    duration = SelectField("Project's Duration (Αpprox.)", default='def',choices=[('def', 'Select Duration'), ('1', 'One Year'), ('2', 'Two Years'), ('3', 'Three Years'), ('4', 'Four Years')])
    submit = SubmitField("Search")
    clear = SubmitField("Clear")

def default_check(form, field):
    if field.data == 'def':
        raise ValidationError("Sex is a required field.")

class ResearcherUpdateForm(FlaskForm):
    first_name = StringField(label = "First Name", validators = [DataRequired(message = "First Name is a required field.")])
    last_name = StringField(label = "Last Name", validators = [DataRequired(message = "Last Name is a required field.")])
    sex = SelectField(label = "Sex", default='def',choices=[('def', 'Select Sex'), ('M', 'Male'), ('F', 'Female'), ('O', 'Other')], validators = [DataRequired(message = "Sex is a required field."), default_check])
    date_of_birth = DateField(label = "Date Of Birth", format='%Y-%m-%d', validators = [DataRequired(message = "Date Of Birth is a required field.")])
    ins_id = SelectField(label = "Works for Institution", coerce=int, validators = [InputRequired(), DataRequired(message = "Institution's ID is a required field."), NumberRange(min=1, message="Institution's ID is a required field.")])
    res_ins_date = DateField(label = "Works Since", format='%Y-%m-%d', validators = [DataRequired(message = "Works since date is a required field.")])
    submit = SubmitField("Create")

class ProjectUpdateForm(FlaskForm):
    title = StringField(label = "Title", validators = [DataRequired(message = "Title is a required field.")])
    description = StringField(label = "Description", validators = [DataRequired(message = "Description is a required field.")])
    start = DateField(label = "Start", format='%Y-%m-%d', validators = [DataRequired(message = "Start Date is a required field.")])
    end = DateField(label = "End", format='%Y-%m-%d', validators = [DataRequired(message = "End Date is a required field.")])
    fund = DecimalField(places=2, label = "Fund", validators = [DataRequired(message = "Fund is a required field.")])
    submit = SubmitField("Create")
