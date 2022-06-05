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
    projectForm_title = StringField(label = "Title", validators = [DataRequired(message = "Title is a required field.")])
    projectForm_description = StringField(label = "Description", validators = [DataRequired(message = "Description is a required field.")])
    start = DateField(label = "Start", format='%Y-%m-%d', validators = [DataRequired(message = "Start Date is a required field.")])
    end = DateField(label = "End", format='%Y-%m-%d', validators = [DataRequired(message = "End Date is a required field.")])
    fund = DecimalField(places=2, label = "Fund", validators = [DataRequired(message = "Fund is a required field.")])
    projectForm_ins_id = SelectField(label = "Managed by Institution", coerce=int, validators = [InputRequired(), DataRequired(message = "Institution's ID is a required field."), NumberRange(min=1, message="Institution's ID is a required field.")])
    prog_id = SelectField(label = "Funded by Program", coerce=int, validators = [InputRequired(), DataRequired(message = "Program's ID is a required field."), NumberRange(min=1, message="Program's ID is a required field.")])
    ex_id = SelectField(label = "Managed by Executive", coerce=int, validators = [InputRequired(), DataRequired(message = "Executive's ID is a required field."), NumberRange(min=1, message="Executive's ID is a required field.")])
    ass_id = SelectField(label = "Assessment", coerce=int, validators = [InputRequired(), DataRequired()])
    ass_res_id = SelectField(label = "Assessed by Researcher", coerce=int, validators = [InputRequired(), DataRequired(message = "Assessor's ID is a required field."), NumberRange(min=1, message="Assessor's ID is a required field.")])
    sup_res_id = SelectField(label = "Supervised by Researcher", coerce=int, validators = [InputRequired(), DataRequired(message = "Supervisor's ID is a required field."), NumberRange(min=1, message="Supervisor's ID is a required field.")])
    submit = SubmitField("Create")

class ProjectCreateForm(FlaskForm):
    projectForm_title = StringField(label = "Title", validators = [DataRequired(message = "Title is a required field.")])
    projectForm_description = StringField(label = "Description", validators = [DataRequired(message = "Description is a required field.")])
    start = DateField(label = "Start", format='%Y-%m-%d', validators = [DataRequired(message = "Start Date is a required field.")])
    end = DateField(label = "End", format='%Y-%m-%d', validators = [DataRequired(message = "End Date is a required field.")])
    fund = DecimalField(places=2, label = "Fund", validators = [DataRequired(message = "Fund is a required field.")])
    projectForm_ins_id = SelectField(label = "Managed by Institution", coerce=int, validators = [InputRequired(), DataRequired(message = "Institution's ID is a required field."), NumberRange(min=1, message="Institution's ID is a required field.")])
    prog_id = SelectField(label = "Funded by Program", coerce=int, validators = [InputRequired(), DataRequired(message = "Program's ID is a required field."), NumberRange(min=1, message="Program's ID is a required field.")])
    ex_id = SelectField(label = "Managed by Executive", coerce=int, validators = [InputRequired(), DataRequired(message = "Executive's ID is a required field."), NumberRange(min=1, message="Executive's ID is a required field.")])
    ass_res_id = SelectField(label = "Assessed by Researcher", coerce=int, validators = [InputRequired(), DataRequired(message = "Assessor's ID is a required field."), NumberRange(min=1, message="Assessor's ID is a required field.")])
    sup_res_id = SelectField(label = "Supervised by Researcher", coerce=int, validators = [InputRequired(), DataRequired(message = "Supervisor's ID is a required field."), NumberRange(min=1, message="Supervisor's ID is a required field.")])
    ass_date = DateField(label = "Assessment's Date", format='%Y-%m-%d', validators = [DataRequired(message = "Date is a required field.")])
    ass_grade = IntegerField(label = "Assessment's Grade", validators = [DataRequired(message = "Grade is a required field.")])
    submit = SubmitField("Create")

class WorksForm(FlaskForm):
    worksForm_proj_id = SelectField(label = "Works At Project", coerce=int, validators = [InputRequired(), DataRequired(message = "Project's ID is a required field."), NumberRange(min=1, message="Project's ID is a required field.")])
    worksForm_res_id = SelectField(label = "Researcher", coerce=int, validators = [InputRequired(), DataRequired(message = "Researcher's ID is a required field."), NumberRange(min=1, message="Researcher's ID is a required field.")])
    submit = SubmitField("Create")

class Proj_FieldForm(FlaskForm):
    proj_fieldForm_proj_id = SelectField(label = "Project", coerce=int, validators = [InputRequired(), DataRequired(message = "Project's ID is a required field."), NumberRange(min=1, message="Project's ID is a required field.")])
    proj_fieldForm_field_id = SelectField(label = "Research Field", coerce=int, validators = [InputRequired(), DataRequired(message = "Field's ID is a required field."), NumberRange(min=1, message="Field's ID is a required field.")])
    submit = SubmitField("Create")

class PhoneForm(FlaskForm):
    phoneForm_ins_id = SelectField(label = "Institution", coerce=int, validators = [Optional()])
    phoneForm_phone_number = IntegerField(label = "Phone Number", validators = [DataRequired(message = "Phone Number is a required field.")])
    submit = SubmitField("Create")

class PhoneCreateForm(FlaskForm):
    phoneForm_ins_id = SelectField(label = "Institution", coerce=int, validators = [InputRequired(), Optional()])
    phoneForm_phone_number = IntegerField(label = "Phone Number", validators = [DataRequired(message = "Phone Number is a required field.")])
    submit = SubmitField("Create")

class DeliverableForm(FlaskForm):
    deliverableForm_proj_id = SelectField(label = "Project", coerce=int, validators = [InputRequired(), DataRequired(message = "Project's ID is a required field."), NumberRange(min=1, message="Project's ID is a required field.")])
    deliverableForm_title = StringField(label = "Title", validators = [DataRequired(message = "Title is a required field.")])
    deliverableForm_description = StringField(label = "Description", validators = [DataRequired(message = "Description is a required field.")])
    deliverableForm_date = DateField(label = "Date", format='%Y-%m-%d', validators = [DataRequired(message = "Date is a required field.")])
    submit = SubmitField("Create")

class DeliverableUpdateForm(FlaskForm):
    deliverableForm_title = StringField(label = "Title", validators = [DataRequired(message = "Title is a required field.")])
    deliverableForm_description = StringField(label = "Description", validators = [DataRequired(message = "Description is a required field.")])
    deliverableForm_date = DateField(label = "Date", format='%Y-%m-%d', validators = [DataRequired(message = "Date is a required field.")])
    submit = SubmitField("Create")

class ExecutiveForm(FlaskForm):
    executiveForm_name = StringField(label = "Name", validators = [DataRequired(message = "Name is a required field.")])
    submit = SubmitField("Create")

class AssessmentForm(FlaskForm):
    assessmentForm_date = DateField(label = "Date", format='%Y-%m-%d', validators = [DataRequired(message = "Date is a required field.")])
    assessmentForm_grade = IntegerField(label = "Grade", validators = [DataRequired(message = "Grade is a required field.")])
    submit = SubmitField("Create")
