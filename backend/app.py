from flask import Flask, request, render_template, redirect, session
from flask_session import Session
from db_connector import get_database_connection, close_database_connection
from passlib.hash import bcrypt_sha256

app = Flask(__name__)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)


# Connect to the database
connection = get_database_connection()
cursor = connection.cursor(dictionary=True) # This is used to execute queries


@app.route('/')
def index():
    if session.get("name"):
        return "Hello World!"
    else:
        return "Login to access this page"


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        data = request.get_json()
        print(data)

        # Check if the request is valid, whether it contains the email and password
        if data.get("email") and data.get("password"):
            email = data["email"]
            input_password = data["password"]

            # Query the database for the user
            cursor.execute("SELECT user_id, password_hash FROM user WHERE email = %s", (email,))
            result = cursor.fetchone()
            
            # Check if the user exists
            if result:
                real_password_hash = result["password_hash"]

                # Verify the password
                if bcrypt_sha256.verify(input_password, real_password_hash):
                    # Passwords match
                    session["name"] = email
                    return ("Login Successful", 200)
                else:
                    # Passwords do not match
                    return ("Login Failed, Password is incorrect", 401)

            # User does not exist
            else:
                return ("Login Failed, User does not exist", 401)
        
        # Request is invalid, does not contain email and/or password
        else:
            return ("Login Failed, incomplete request", 401)
    
    return "Page Under Construction"


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        data = request.get_json()
        print(data)

        if data.get("first_name") and data.get("email") and data.get("password"):
            first_name = data.get("first_name")
            last_name = data.get("last_name")
            email = data.get("email")
            input_password = data.get("password")
            phone_number = data.get("phone_number")
            address_line01 = data.get("address_line01")
            address_city = data.get("address_city")
            address_state = data.get("address_state")
            address_zip_code = data.get("address_zip_code")
            address_country = data.get("address_country")

            # Query the database for the user to check if they already exist
            cursor.execute("SELECT user_id, password_hash FROM user WHERE email = %s", (email,))
            result = cursor.fetchone()

            # Check if the user with email exists
            if result:
                return ("Registration Failed, email already in use", 401)
            
            else:
                # Encrypt the password
                password_hash = bcrypt_sha256.hash(input_password)

                # Insert the user into the database
                cursor.execute("""INSERT INTO user (user_id, user_type, first_name, last_name, email, password_hash, phone_number, address_line01, 
                                  address_city, address_state, address_zip_code, address_country)
                                VALUES (%s, 'user', %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                                ('46', first_name, last_name, email, password_hash, phone_number, address_line01, 
                                 address_city, address_state, address_zip_code, address_country))
                
                connection.commit()

                return ("Registration Successful", 200)
        
        else:
            return ("Registration Failed, incomplete request", 401)
    
    return "Page Under Construction"


@app.route('/logout')
def logout():
    session.clear()
    return "Logged out"


@app.route('/products/<string:category>')
def products(category):
    if category is None:
        # Query the database for all products
        cursor.execute("SELECT * FROM product")
        result = cursor.fetchall()

        return result
    
    else:
        return "Categorical Sorting not yet implemented"


@app.route('/products/<int:product_id>')
def product(product_id):
    # Query the database for the product
    cursor.execute("SELECT * FROM product WHERE product_id = %s", (product_id,))
    product = cursor.fetchone()

    cursor.execute("SELECT custom_attribute_type, custom_attribute_value FROM product_custom_property WHERE product_id = %s", (product_id,))


    # Add the custom attributes to the product
    for row in cursor.fetchall():
        product[row["custom_attribute_name"]] = row["custom_attribute_value"]

    # Get the products variants
    cursor.execute("SELECT price, variant_attribute_value_1, variant_attribute_value_2 FROM variant WHERE product_id = %s", (product_id,))
    result = cursor.fetchall()

    product["variants"] = result

    return product


# For debugging purposes, do not run in production!
if __name__ == '__main__':
    from werkzeug.serving import run_simple
    run_simple('localhost', 5000, app, use_reloader=True)