from flask import Flask, request, render_template, redirect
from db_connector import get_database_connection, close_database_connection
from passlib.hash import bcrypt_sha256

app = Flask(__name__)

# Connect to the database
connection = get_database_connection()
cursor = connection.cursor() # This is used to execute queries


@app.route('/')
def index():
    return "Hello World!"


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        data = request.get_json()
        print(data)

        # Check if the request is valid, whether it contains the username and password
        if data.get("username") and data.get("password"):
            username = data["username"]
            input_password = data["password"]

            # Query the database for the user
            cursor.execute("SELECT ID, password FROM user WHERE username = %s", (username,))
            result = cursor.fetchone()
            
            # Check if the user exists
            if result:
                real_password_hash = result[1]

                # Verify the password
                if bcrypt_sha256.verify(input_password, real_password_hash):
                    # Passwords match
                    return ("Login Successful", 200)
                else:
                    # Passwords do not match
                    return ("Login Failed, Password is incorrect", 401)

            # User does not exist
            else:
                return ("Login Failed, User does not exist", 401)
        
        # Request is invalid, does not contain username and/or password
        else:
            return ("Login Failed, incomplete request", 401)
    
    return "Page Under Construction"


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        data = request.get_json()
        print(data)

        if data.get("name") and data.get("username") and data.get("password"):
            name = data["name"]
            username = data["username"]
            input_password = data["password"]

            # Query the database for the user to check if they already exist
            cursor.execute("SELECT ID, password FROM user WHERE username = %s", (username,))
            result = cursor.fetchone()

            # Check if the user with username exists
            if result:
                return ("Registration Failed, username already in use", 401)
            
            else:
                # Encrypt the password
                password_hash = bcrypt_sha256.hash(input_password)

                # Insert the user into the database
                cursor.execute("INSERT INTO user (name, username, password) VALUES (%s, %s, %s)", (name, username, password_hash))
                connection.commit()

                return ("Registration Successful", 200)
        
        else:
            return ("Registration Failed, incomplete request", 401)
    
    return "Page Under Construction"


# For debugging purposes, do not run in production!
if __name__ == '__main__':
    from werkzeug.serving import run_simple
    run_simple('localhost', 5000, app, use_reloader=True)