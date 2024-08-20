from flask import Flask

server = Flask(__name__)

@server.route('/',methods=['GET'])
def index():
    return 'Hello World'


server.run('0.0.0.0',5000,debug=True)