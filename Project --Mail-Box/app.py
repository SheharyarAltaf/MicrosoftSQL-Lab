from flask import Flask, jsonify
from flask import Flask, render_template, flash, redirect, url_for, session, request, logging
from wtforms import Form, StringField, TextAreaField, PasswordField, validators, DateField
from passlib.hash import sha256_crypt
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from database import User, Email, Draft, Inbox, Sentbox
from functools import wraps
import datetime
import logging
import os





#init app
app = Flask(__name__)


basedir = os.path.abspath(os.path.dirname(__file__))



app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///'+os.path.join(basedir,'myapp.sqlite')
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False



#Init db
db = SQLAlchemy(app)





#help
@app.route('/help')
def help():
	return render_template('help.html')


@app.route('/', methods=["GET","POST"])
def hello():
	error = None
	if request.method == 'POST':		
		username = request.form['email']
		search = db.session.query(User).filter_by(email=username).first()
		if search is not None:
			return redirect(url_for("login", username=username))
		else:
			error = "User not exist"
			return render_template('index.html', error=error)
	return render_template('index.html',error=error)



@app.route('/index', methods=["GET", "POST"])
def index():
	error = None
	if request.method == 'POST':		
		username = str(request.form['email'])
		search = db.session.query(User).filter_by(email=username).first()
		if search is not None:
			return redirect(url_for("login", username=username))
		else:
			error = "User not exist"
			return render_template('index.html', error=error)
	return render_template('index.html',error=error)





@app.route('/login/<username>', methods=["GET", "POST"])
def login(username):
	if request.method == 'POST':
		user = username
		
		password_candidate = str(request.form['password'])
		
		search = db.session.query(User).filter_by(email=user).first()
		
		password = search.password

		if sha256_crypt.verify(password_candidate, password):
				#Passed
			session["logged_in"] = True
			session['username'] = user
			# flash("you are now logged in ", "success")
			return redirect(url_for('inbox'))

		else:
			error = 'Password not match'
			return render_template('login.html', error=error)
		
		
	return render_template('login.html')



# check if user logged in  
def is_logged_in(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if "logged_in" in session:
			return f(*args, **kwargs)
		else:
			flash("Unauthorized, Please login", "danger")
			return redirect(url_for("login"))
	return wrap






# registeration form
class RegisterForm(Form):
    fname = StringField("",[validators.Length(min=1, max=50)])
    lname  = StringField('', [validators.Length(min=4, max=25)])
    phone = StringField('', [validators.Length(min=6, max=20)])
    dob = DateField('')
    username = StringField('', [validators.Length(min=6, max=50)])
    password = PasswordField('', [validators.DataRequired(), validators.EqualTo('confirm', message='Password do not match'), validators.Length(min=6)])
    confirm=PasswordField('')




# user register
@app.route('/signup', methods=['GET', 'POST'])
def signup():
	form = RegisterForm(request.form)
	if request.method == 'POST' and form.validate():
		fname = form.fname.data
		lname = form.lname.data
		phone = form.phone.data
		dob = form.dob.data
		username = form.username.data
		password = sha256_crypt.encrypt(str(form.password.data))
		# password = form.password.data

		obj = User(fname, lname, password, dob, phone, username)
		#Create cursor
		db.session.add(obj)
		db.session.commit()


		flash("You are now registered and can log in", "success")	
		return redirect(url_for("signup"))	


	return render_template('signup.html', form=form)


# registeration form
# class MessageForm(Form):
#     subject = StringField("")
#     msg  = StringField('')
#     receiver_email = StringField('')
#     time = datetime.datetime.now()



def insertion():
	user = session['username']
	email = request.form['email']
	msg = request.form['inputBody']
	subject = request.form['subject']
	time = datetime.datetime.now()
	obj1 = Email(subject, msg, email, user, time)
	db.session.add(obj1)
	db.session.commit()
	result = db.session.query(Email).filter_by(time=time).first()
	email_id = result.email_id
	obj2 = Sentbox(user, email_id)
	db.session.add(obj2)
	db.session.commit()
	obj3 = Inbox(email, email_id)
	db.session.add(obj3)
	db.session.commit()




#inbox
@app.route('/inbox',methods=["POST","GET"])
@is_logged_in
def inbox():
	user = session['username']
	results = None
	if request.method=="POST":
		insertion()
	else:
		results = db.session.query(Email).filter_by(receiver_email=user).all()
		# print(results[0].subject)
	return render_template("inbox.html",results=results)



#inbox
@app.route('/sent', methods=["POST","GET"])
@is_logged_in
def sent():
	user = session['username']
	results = None
	if request.method=="POST":
		insertion()
	else:
		results = db.session.query(Email).filter_by(sender_email=user).all()
	return render_template("sent.html", results=results)


#inbox
@app.route('/stared', methods=["POST","GET"] )
@is_logged_in
def stared():
	user = session['username']
	results = None
	if request.method=="POST":
		insertion()
	else:
		results = db.session.query(Email).filter_by(sender_email=user).all()
	return render_template("stared.html", results=results)



#draft
@app.route('/draft' ,methods=["POST","GET"])
@is_logged_in
def draft():
	user = session['username']
	results = None
	if request.method=="POST":
		insertion()
	else:
		results = db.session.query(Email).filter_by(sender_email=user).all()
	return render_template("draft.html", results=results)


@app.route('/mails',methods=["POST","GET"])
@is_logged_in
def mails():
	user = session['username']
	results = None
	if request.method=="POST":
		insertion()
	else:
		results = db.session.query(Email).filter_by(sender_email=user).all()
		temp =  db.session.query(Email).filter_by(receiver_email=user).all()
		for i in temp:
			results.append(i)
	return render_template("mails.html", results=results)


	



@app.route('/savingdraft',methods=["POST","GET"])
@is_logged_in
def savingdraft():
	return redirect(url_for('inbox'))


@app.route('/logout')
@is_logged_in
def logout():
	session.clear()
	flash("you are now logged out", 'success')
	return redirect(url_for('index'))



#Run Server
if __name__== "__main__":
	#set logging
	app.config['SECRET_KEY'] = "Sheharyar"
	logging.basicConfig()
	logging.getLogger('sqlalchemy.engine').setLevel(logging.INFO)
	app.run(debug=True)
