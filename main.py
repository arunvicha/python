from flask import Flask
from public import public
from admin import  admin



app=Flask(__name__)
app.secret_key="androcoach"
app.register_blueprint(admin, url_prefix='/admin')
app.register_blueprint(public)
app.run(debug=True, port=5551,host='')