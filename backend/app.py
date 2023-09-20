from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello World!"

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        data = request.get_json()
        print(data)
        return "Login Successful"
    
    return "Page Under Construction"