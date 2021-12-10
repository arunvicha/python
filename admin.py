from flask import *
from database  import *
import uuid

admin=Blueprint('admin',__name__)

@admin.route('/adminhome')
def adminhome():
	return render_template('adminhome.html')


@admin.route('/admin_coachreg',methods=['get','post'])
def coachreg():
	data={}
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	
	if action=='delete':
		q="delete from coaches where login_id='%s'" %(id)
		delete(q)
		q1="delete from login where login_id='%s'"%(id)
		delete(q1)
		flash('deleted')
		return redirect(url_for('admin.coachreg'))
	if action=='update':
		q="select * from coaches where coach_id='%s'" %(id)
		res=select(q)
		data['coach']=res

	if 'updated' in request.form:
		fname=request.form['fname']
		lname=request.form['lname']
		place=request.form['place']
		phone=request.form['phone']	
		email=request.form['email']
		age=request.form['age']
		gender=request.form['gender']
		descr=request.form['descr']
		q="update coaches set fname='%s', lname='%s', place='%s',  phone='%s', email='%s', age='%s', gender='%s', descr='%s' where coach_id='%s'" %(fname,lname,place,phone,email,age,gender,descr,id)
		update(q)
		flash('updated profile')
		return redirect(url_for('admin.coachreg'))

	if 'submit' in request.form:
		fname=request.form['fname']
		lname=request.form['lname']
		uname=request.form['uname']
		passs=request.form['pass']
		place=request.form['place']
		phone=request.form['phone']	
		email=request.form['email']
		age=request.form['age']
		gender=request.form['gender']
		descr=request.form['descr']

		q="insert into login values(null,'%s','%s','Coach')" %(uname,passs)
		idd=insert(q)

		q="insert into coaches values(null,'%s','%s','%s','%s',%s,'%s',%s,'%s','%s')" %(idd,fname,lname,place,phone,email,age,gender,descr)
		insert(q)
		flash('success')

	q="select *,concat(fname,' ',lname) as name from coaches"
	res=select(q)
	data['viewcoach']=res
	return render_template('admin_coachreg.html', data=data)



@admin.route('/admin_physioreg',methods=['get','post'])
def physioreg():
	data={}
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	
	if action=='delete':
		q="delete from physio where login_id='%s'" %(id)
		delete(q)
		q1="delete from login where login_id='%s'"%(id)
		delete(q1)
		flash('deleted')
		return redirect(url_for('admin.physioreg'))
	if action=='update':
		q="select * from physio where phy_id='%s'" %(id)
		res=select(q)
		data['physio']=res

	if 'update' in request.form:
		fname=request.form['fname']
		lname=request.form['lname']
		place=request.form['place']
		phone=request.form['phone']	
		email=request.form['email']
		age=request.form['age']
		quali=request.form['quali']
		q="update physio set fname='%s', lname='%s', place='%s',  phone='%s', email='%s', age='%s', quali='%s' where phy_id='%s'" %(fname,lname,place,phone,email,age,quali,id)
		update(q)
		flash('updated')
		return redirect(url_for('admin.physioreg'))

	if 'submit' in request.form:
		fname=request.form['fname']
		lname=request.form['lname']
		uname=request.form['uname']
		passs=request.form['pass']
		place=request.form['place']
		phone=request.form['phone']	
		email=request.form['email']
		age=request.form['age']
		quali=request.form['quali']

		q="insert into login values(null,'%s','%s','physio')" %(uname,passs)
		idd=insert(q)

		q="insert into physio values(null,'%s','%s','%s','%s',%s,'%s',%s,'%s')" %(idd,fname,lname,place,phone,email,age,quali)
		insert(q)
		flash('success')

	q="select *,concat(fname,' ',lname) as name from physio"
	res=select(q)
	data['viewphysio']=res
	return render_template('admin_physioreg.html', data=data)


@admin.route('/admin_playerreg',methods=['get','post'])
def playerreg():
	data={}
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	
	if action=='delete':
		q="delete from player where login_id='%s'" %(id)
		delete(q)
		q1="delete from login where login_id='%s'"%(id)
		delete(q1)

		flash('Deleted')
		
	if action=='update':
		q="select * from player where player_id='%s'" %(id)
		res=select(q)
		data['player']=res

	if 'update' in request.form:
		propic=request.files['propic']
		path='static/uploads/'+str(uuid.uuid4())+propic.filename
		propic.save(path)
		fname=request.form['fname']
		lname=request.form['lname']
		place=request.form['place']
		phone=request.form['phone']	
		email=request.form['email']
		dob=request.form['dob']
		gender=request.form['gender']
		hname=request.form['hname']
		q="update player set pro_pic='%s', fname='%s', lname='%s', place='%s',  phone='%s', email='%s', dob='%s', gender='%s', hname='%s' where player_id='%s'" %(path,fname,lname,place,phone,email,dob,gender,hname,id)
		update(q)
		flash('Updated')
		return redirect(url_for('admin.playerreg'))

	if 'submit' in request.form:
		propic=request.files['propic']
		path='static/uploads/'+str(uuid.uuid4())+propic.filename
		propic.save(path)
		fname=request.form['fname']
		lname=request.form['lname']
		uname=request.form['uname']
		passs=request.form['pass']
		place=request.form['place']
		phone=request.form['phone']	
		email=request.form['email']
		dob=request.form['dob']
		gender=request.form['gender']
		hname=request.form['hname']

		q="insert into login values(null,'%s','%s','player')" %(uname,passs)
		idd=insert(q)

		q="insert into player values(null,'%s','%s','%s','%s','%s',%s,'%s','%s','%s','%s')" %(idd,path,fname,lname,place,phone,email,dob,gender,hname)
		insert(q)
		flash('Success')
		return redirect(url_for('admin.playerreg'))

	q="select *,concat(fname,' ',lname) as name from player"
	res=select(q)
	data['viewplayer']=res
	return render_template('admin_playerreg.html', data=data)



@admin.route('/admin_viewfans', methods=['get','post'])
def viewfans():
	data={}
	q="select *,concat(fname, ' ',lname)as name from fan"
	res=select(q)
	data['viewfans']=res
	return render_template('admin_viewfans.html', data=data)	




@admin.route('/admin_managevenue',methods=['get','post'])
def managevenue():
	data={}
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	
	if action=='delete':
		q="delete from venues where venue_id='%s'" %(id)
		delete(q)
		flash('Deleted')
	if action=='update':
		q="select * from venues where venue_id='%s'" %(id)
		res=select(q)
		data['venue']=res

	if 'update' in request.form:
		
		vname=request.form['name']
		descr=request.form['descr']
		place=request.form['place']
		q="update venues set venuename='%s', descr='%s', place='%s' where venue_id='%s'" %(vname,descr,place,id)
		update(q)
		flash('Updated')
		return redirect(url_for('admin.managevenue'))

	if 'submit' in request.form:
		vname=request.form['name']
		descr=request.form['descr']
		place=request.form['place']

		q="insert into venues values(null,'%s','%s','%s')" %(vname,descr,place)
		insert(q)
		flash('Success')
		return redirect(url_for('admin.managevenue'))

	q="select * from venues"
	res=select(q)
	data['viewvenue']=res
	return render_template('admin_managevenue.html', data=data)



@admin.route('/admin_schedulegames',methods=['get','post'])
def schedulegames():
	data={}
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	
	if action=='delete':
		q="delete from games where game_id='%s'" %(id)
		delete(q)
		flash('deleted')
	if action=='update':
		q="select * from games where game_id='%s'" %(id)
		res=select(q)
		data['games']=res

	if 'update' in request.form:
		vname=request.form['vname']
		team=request.form['team']
		datetime=request.form['datetime']
		q="update games set venue_id='%s',againstteam='%s', datetime='%s', status='not started' where game_id='%s'" %(vname,team,datetime,id)
		update(q)
		flash('updated')
		return redirect(url_for('admin.schedulegames'))

	if 'submit' in request.form:
		vname=request.form['vname']
		team=request.form['team']
		datetime=request.form['datetime']
		q="insert into games values(null,'%s','%s','%s','not started')" %(vname,team,datetime)
		insert(q)
		flash('success')

	q="select * from venues"
	res=select(q)
	data['venue']=res
	q="select * from games inner join venues using(venue_id)"
	res=select(q)
	data['viewgames']=res
	return render_template('admin_schedulegames.html', data=data)



@admin.route('/admin_viewmessage',methods=['get','post'])
def messages():
	data={}

	q="SELECT *,concat(`fname`,' ',`lname`)AS NAME FROM coaches INNER JOIN `message` ON message.`sender_id`=`coaches`.`login_id`"
	res=select(q)
	data['viewmessage']=res
	j=0
	for i in range(1,len(res)+1):
		print('submit'+str(i))
		if 'submit'+str(i) in request.form:
			replay=request.form['replay'+str(i)]
			print(replay)
			print(j)
			print(res[j]['message_id'])
			q="update message set reply='%s' where message_id='%s'" %(replay,res[j]['message_id'])
			print(q)
			update(q)
			return redirect(url_for('admin.messages')) 	
		j=j+1
	return render_template('admin_viewmessage.html', data=data)


