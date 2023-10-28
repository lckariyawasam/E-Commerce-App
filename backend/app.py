from flask import Flask, request, render_template, redirect, session
from flask_session import Session
from flask_cors import CORS, cross_origin
from db_connector import get_database_connection, close_database_connection
from passlib.hash import bcrypt_sha256

app = Flask(__name__)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
CORS(app, supports_credentials=True, origins=["http://localhost:3000"])
Session(app)


# Connect to the database
connection = get_database_connection()
cursor = connection.cursor(dictionary=True) # This is used to execute queries


# Write a decorator to check if the user is logged in
def session_required(f):
    def decorated_function(*args, **kwargs):
        if session.get("user_id") is None:
            # Create a guest user
            cursor.execute("INSERT INTO user (user_type) VALUES ('Guest')")
            connection.commit()
            session["user_id"] = cursor.lastrowid
            session["user_type"] = "Guest"
        return f(*args, **kwargs)
    return decorated_function


@app.route('/')
@session_required
def index():
    if session.get("user_id"):
        return "Hello World!"
    else:
        return "Login to access this page"


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        data = request.get_json()

        # Check if the request is valid, whether it contains the email and password
        if data.get("email") and data.get("password"):
            email = data["email"]
            input_password = data["password"]

            # Query the database for the user
            cursor.execute("SELECT user_id, user_type, password_hash FROM user WHERE email = %s", (email,))
            result = cursor.fetchone()
            
            # Check if the user exists
            if result:
                real_password_hash = result["password_hash"]

                # Verify the password
                if bcrypt_sha256.verify(input_password, real_password_hash):
                    # Passwords match
                    session["user_id"] = result["user_id"]
                    session["user_type"] = result["user_type"]
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
    
    return ("Page Under Construction", 200)


@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()

    if data.get("first_name") and data.get("email") and data.get("password"):
        first_name = data.get("first_name")
        last_name = data.get("last_name")
        email = data.get("email")
        input_password = data.get("password")
        # phone_number = data.get("phone_number")
        # address_line01 = data.get("address_line01")
        # address_city = data.get("address_city")
        # address_state = data.get("address_state")
        # address_zip_code = data.get("address_zip_code")
        # address_country = data.get("address_country")


        # Phone number and address details are ignored and commented out for now

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
            cursor.execute("""INSERT INTO user (user_type, first_name, last_name, email, password_hash)
                            VALUES ('user', %s, %s, %s, %s)""",
                            (first_name, last_name, email, password_hash))
            
            connection.commit()

            return ("Registration Successful", 200)
    
    else:
        return ("Registration Failed, incomplete request", 401)


@app.route('/logout')
def logout():
    session.clear()
    return "Logged out"


@app.route('/products')
def products():
    # Query the database for all products
    cursor.execute("SELECT * FROM product")
    result = cursor.fetchall()

    return result

@app.route('/products/<string:category>')
def products_by_category(category):
    # Query the database for all products
    cursor.execute("SELECT * FROM (product NATURAL JOIN product_sub_category) JOIN category using(category_id) WHERE category.name = %s", (category,))
    result = cursor.fetchall()

    return result


@app.route('/product/<int:product_id>')
def product(product_id):
    # Query the database for the product
    cursor.execute("SELECT * FROM product WHERE product_id = %s", (product_id,))
    product = cursor.fetchone()

    cursor.execute("SELECT custom_attribute_type, custom_attribute_value FROM product_custom_property WHERE product_id = %s", (product_id,))


    # Add the custom attributes to the product
    for row in cursor.fetchall():
        product[row["custom_attribute_name"]] = row["custom_attribute_value"]

    # Get the products variants
    cursor.execute("SELECT variant_id, sku, price, variant_attribute_value_1, variant_attribute_value_2 FROM variant WHERE product_id = %s", (product_id,))
    result = cursor.fetchall()

    product["variants"] = result

    return product


@app.route('/cart', endpoint='cart')
@session_required
def cart():
    # Only allow user to access their own cart
    # Admins can access any cart
    if session.get("user_id"):
        # Query the database for the user's cart
        cursor.execute("SELECT cart_id FROM cart WHERE user_id = %s AND status = 'Pending' ", (session.get("user_id"),))

        cart_id = cursor.fetchone()["cart_id"]

        # Query the database for the cart items
        cursor.execute("SELECT * FROM cart_item JOIN variant using(variant_id) JOIN product using(product_id) WHERE cart_id = (%s)", (cart_id, ))

        results = []

        for cart_item in cursor.fetchall():
            # Return only the necessary details of the products in the cart
            modified_cart_item = {
                "variant_id": cart_item["variant_id"],
                "title": cart_item["title"],
                "price": cart_item["price"],
                "quantity": cart_item["quantity"],
                "cart_item_id": cart_item["cart_item_id"]
            }
            results.append(modified_cart_item)

        return results
    
    else:
        return ("Unauthorized", 401)
    

@app.route('/cart/add', methods=['POST'], endpoint='add_to_cart')
@session_required
def add_to_cart():
    data = request.get_json()

    if data.get("variant_id") and data.get("quantity"):
        variant_id = data.get("variant_id")
        quantity = data.get("quantity")

        # Get the cart of the user
        cursor.execute("SELECT cart_id FROM cart WHERE user_id = %s AND status = 'Pending'", (session.get("user_id"),))

        cart_id = cursor.fetchone()["cart_id"]

        cursor.execute("INSERT INTO cart_item (variant_id, cart_id, quantity, status) VALUES (%s, %s, %s, %s)", (variant_id, cart_id, quantity, "Pending"))
        connection.commit()


        return ("Item Added", 200)

    else:
        return ("Incomplete Request", 401)


@app.route("/cart/remove", methods=['POST'])
def remove_from_cart():
    data = request.get_json()

    if data.get("cart_item_id"):
        cart_item_id = data.get("cart_item_id")

        # Get the cart of the user
        cursor.execute("SELECT cart_id FROM cart WHERE user_id = %s AND status = 'Pending'", (session.get("user_id"),))

        cart_id = cursor.fetchone()["cart_id"]

        cursor.execute("SELECT cart_item_id FROM cart_item WHERE cart_id = %s", (cart_id,))

        if (cart_item_id not in [row["cart_item_id"] for row in cursor.fetchall()]):
            return ("Unauthorized", 401)
        
        else:
            cursor.execute("DELETE FROM cart_item WHERE cart_item_id = %s", (cart_item_id,))
            connection.commit()

        return ("Item Removed", 200)

    else:
        return ("Incomplete Request", 401)


# For debugging purposes, do not run in production!
if __name__ == '__main__':
    from werkzeug.serving import run_simple
    run_simple('localhost', 5000, app, use_reloader=True)