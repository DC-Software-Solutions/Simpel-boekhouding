from flask import Flask, render_template

server = Flask(__name__)

@server.route('/',methods=['GET'])
def index():
    return render_template('index.html')


server.run('0.0.0.0',5000,debug=True)