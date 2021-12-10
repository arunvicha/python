from flask import *
from database import *

public=Blueprint('public', __name__)

@public.route('/')
def home():
	return render_template('index.html')

@public.route('/login', methods=['get','post'])
def login():
	if 'submit' in request.form:
		user=request.form['username']
		passs=request.form['password']
		q="select * from login where username='%s' and password='%s'" %(user,passs)
		res=select(q)

		if res:
			session['loginid']=res[0]['login_id']

		if res[0]['usertype']=='admin':
			return redirect(url_for('admin.adminhome'))
		else:
			flash("invalid username and password")

	return render_template('login.html')	







	
