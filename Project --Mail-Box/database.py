from sqlalchemy import create_engine

from sqlalchemy_utils import create_database, database_exists
from sqlalchemy import create_engine, MetaData, Table, Integer, String, Column, DateTime, ForeignKey, Numeric, DateTime
from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime
import os
# user = "root"
# password = ""
# host = "localhost"
# port = '5000'
# database = "myapp"
basedir = os.path.abspath(os.path.dirname(__file__))
db = create_engine('sqlite:///'+os.path.join(basedir,'myapp.sqlite'))

# This engine just used to query for list of databases
# mysql_engine = create_engine('mysql://{0}:{1}@{2}:{3}'.format(user, password, host, port))





# # Query for existing databases
# mysql_engine.execute("IF EXIST DROP DATABASE {0} ".format(database))
# mysql_engine.execute("CREATE DATABASE IF NOT EXISTS {0} ".format(database))


# Go ahead and use this engine
# db = create_engine('mysql://{0}:{1}@{2}:{3}/{4}'.format(user, password, host, port, database))

# if not database_exists(db.url):
# 	create_database(db.url)


Base = declarative_base()


#user
class User(Base):
	"""docstring for User"""
	__tablename__ = 'users'
	fname = Column(String(50), nullable=False)
	lname = Column(String(50), nullable=False)
	password = Column(String(100), nullable=False)
	dob = Column(DateTime(), nullable=False)
	phone = Column(String(20), nullable=False)
	email = Column(String(50), primary_key=True, nullable=False)

	def __init__(self, fname, lname, password, dob, phone, email):
		self.fname = fname
		self.lname = lname
		self.password = password
		self.dob = dob
		self.phone = phone
		self.email = email




#Email
class Email(Base):
	"""docstring for Email"""
	__tablename__ = 'emails'
	email_id = Column(Integer, primary_key=True)
	subject = Column(String(100))
	msg = Column(String(1000))
	receiver_email = Column(String(50))
	sender_email = Column(String(50), nullable=False)
	time = Column(DateTime(), nullable=False)

	def __init__(self, subject, msg, receiver_email, sender_email, time ):
		
		self.subject = subject
		self.msg = msg
		self.receiver_email = receiver_email
		self.sender_email = sender_email
		self.time = time



#Inbox
class Inbox(Base):
	"""docstring for Inbox"""
	__tablename__ = "inbox"
	email_id = Column(Integer, ForeignKey("emails.email_id", onupdate="cascade"),  nullable=False)
	user_id = Column(String(50), ForeignKey("users.email"), nullable=False)
	inbox_id = Column(Integer, nullable=False, primary_key=True)

	def __init__(self, user_id, email_id):
		self.user_id = user_id
		self.email_id = email_id




#Sentbox
class Sentbox(Base):
	"""docstring for Sentbox"""
	__tablename__ = "sentbox"
	email_id = Column(Integer, ForeignKey("emails.email_id", onupdate="cascade"), nullable=False)
	user_id = Column(String(50), ForeignKey("users.email"), nullable=False )
	sentbox_id = Column(Integer, nullable=False, primary_key=True)

	def __init__(self, user_id, email_id):
		self.user_id = user_id
		self.email_id = email_id


#Draft
class Draft(Base):
	"""docstring for Draft"""
	__tablename__ = "draft"
	email_id = Column(Integer, ForeignKey("emails.email_id", onupdate="cascade"), nullable=False)
	user_id = Column(String(50), ForeignKey("users.email"), nullable=False )
	draft_id = Column(Integer, nullable=False, primary_key=True)

	def __init__(self, user_id, email_id):
		self.user_id = user_id
		self.email_id = email_id


Base.metadata.create_all(db)
