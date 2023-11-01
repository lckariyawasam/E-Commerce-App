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


# Write a decorator to check if the user is an admin
def admin_only(f):
    def decorated_function(*args, **kwargs):
        if session.get("user_type") != "Admin":
            # print(session.get("user_type"))
            return ("Unauthorized", 401)
        return f(*args, **kwargs)
    return decorated_function

# Write a decorator to check if the user is an admin
def inventory_access(f):
    def decorated_function(*args, **kwargs):
        if session.get("user_type") != "Admin" and session.get("user_type") != "Inventory Manager":
            # print(session.get("user_type"))
            return ("Unauthorized", 401)
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
                    return ({
                        "user_type": result["user_type"]
                    }, 200)
                else:
                    # Passwords do not match
                    return ("Login Failed, Password is incorrect", 401)

            # User does not exist
            else:
                return ("Login Failed, User does not exist", 401)
        
        # Request is invalid, does not contain email and/or password
        else:
            return ("Login Failed, incomplete request", 401)
    
    return ("Invalid Method", 404)


@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()

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


        # Phone number and address details are ignored and commented out for now

        # Query the database for the user to check if they already exist
        cursor.execute("SELECT user_id, password_hash FROM user WHERE email = %s", (email,))
        result = cursor.fetchone()

        # Check if the user with email exists
        if result:
            return ("Registration Failed, email already in use", 400)
        
        else:
            # Encrypt the password
            password_hash = bcrypt_sha256.hash(input_password)

            # Insert the user into the database
            cursor.execute("""INSERT INTO user (user_type, first_name, last_name, email, password_hash, 
                           phone_number, address_line01, address_city, address_state, address_zip_code, address_country)
                            VALUES ('Registered', %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                            (first_name, last_name, email, password_hash,
                             phone_number, address_line01, address_city, address_state, address_zip_code, address_country))
            
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
    results = cursor.fetchall()

    return results


@app.route('/products/sorted')
def products_sorted():
    # Query the database for all products
    # cursor.execute("SELECT * FROM product")
    cursor.execute("""
        SELECT product_id, title, c.name as category, c2.name as parent_category, icon
        FROM product NATURAL JOIN product_sub_category 
        JOIN category c USING(category_id) 
        JOIN category c2 ON c.parent_category_id = c2.category_id
        JOIN variant USING (product_id)
        """
    )
    results = cursor.fetchall()

    categoriesed_results = {}

    def check_product_in_category(product, category):
        for item in categoriesed_results[category]:
            if item["product_id"] == product["product_id"]:
                return True
        return False
    
    for result in results:
        if result["parent_category"] not in categoriesed_results:
            categoriesed_results[result["parent_category"]] = []
        if len(categoriesed_results[result["parent_category"]]) < 3 and not check_product_in_category(result, result["parent_category"]):
            categoriesed_results[result["parent_category"]].append(result)

        if result["category"] not in categoriesed_results:
            categoriesed_results[result["category"]] = []
        if len(categoriesed_results[result["category"]]) < 3 and not check_product_in_category(result, result["category"]):
            categoriesed_results[result["category"]].append(result)

    return categoriesed_results


@app.route('/products/sorted_full')
def products_sorted_full():
    # Query the database for all products
    # cursor.execute("SELECT * FROM product")
    cursor.execute("""
        SELECT product_id, title, c.name as category, c2.name as parent_category, icon
        FROM product NATURAL JOIN product_sub_category 
        JOIN category c USING(category_id) 
        JOIN category c2 ON c.parent_category_id = c2.category_id
        JOIN variant USING (product_id)
        """
    )
    results = cursor.fetchall()

    categoriesed_results = {}

    def check_product_in_category(product, category):
        for item in categoriesed_results[category]:
            if item["product_id"] == product["product_id"]:
                return True
        return False
    
    for result in results:
        if result["parent_category"] not in categoriesed_results:
            categoriesed_results[result["parent_category"]] = []
        # if len(categoriesed_results[result["parent_category"]]) < 3 and not check_product_in_category(result, result["parent_category"]):
        if not check_product_in_category(result, result["parent_category"]):
            categoriesed_results[result["parent_category"]].append(result)

        if result["category"] not in categoriesed_results:
            categoriesed_results[result["category"]] = []
        # if len(categoriesed_results[result["category"]]) < 3 and not check_product_in_category(result, result["category"]):
        if not check_product_in_category(result, result["category"]):
            categoriesed_results[result["category"]].append(result)

    return categoriesed_results


@app.route('/products/<string:category>')
def products_by_category(category):
    # Query the database for all products
    # cursor.execute("SELECT * FROM (product NATURAL JOIN product_sub_category) JOIN category using(category_id) WHERE category.name = %s", (category,))
    cursor.execute("""
            SELECT product_id, title, c.name as category, c2.name as parent_category 
            FROM product NATURAL JOIN product_sub_category 
	        JOIN category c USING(category_id) 
	        JOIN category c2 ON c.parent_category_id = c2.category_id
            WHERE c2.name = %s OR c.name = %s
            LIMIT 9
        """,
        (category, category))
    
    result = cursor.fetchall()

    return result


@app.route('/product/<int:product_id>')
def product(product_id):
    # Query the database for the product
    cursor.execute("SELECT * FROM product WHERE product_id = %s", (product_id,))
    product = cursor.fetchone()

    if (product is None):
        return ("Product does not exist", 404)

    cursor.execute("SELECT custom_attribute_type, custom_attribute_value FROM product_custom_property WHERE product_id = %s", (product_id,))


    # Add the custom attributes to the product
    for row in cursor.fetchall():
        product[row["custom_attribute_type"]] = row["custom_attribute_value"]

    # Get the products variants
    cursor.execute("""
                   SELECT variant_id, sku, price, variant_attribute_value_1, variant_attribute_value_2, icon 
                   FROM variant WHERE product_id = %s
                   ORDER BY variant_attribute_value_1, variant_attribute_value_2
                   """, 
                   (product_id,))
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
    
    

@app.route("/cart/checkout", methods=['POST'], endpoint='checkout')
@session_required
def checkout():
    data = request.get_json()

    if data.get("payment_method") and data.get("force_checkout") is not None:

        if (data.get("force_checkout") == False):
            cursor.callproc("checkout_user", (session.get("user_id"), data.get("payment_method")))
            connection.commit()
            
            for result in cursor.stored_results():
                return_value = result.fetchall()
                if (return_value[0]["insufficient_stock_variant_id"] is not None):
                    result = {
                        "insufficient_stock_variant_id": return_value[0]["insufficient_stock_variant_id"],
                    }
                    return (result, 404)
                else:
                    break
            return ("Checkout Successful", 200)
        else:
            # Not implmeneted yet 
            cursor.callproc("checkout_user_on_request", (session.get("user_id"), data.get("payment_method")))
            connection.commit()
            return ("Checkout Successful", 200)
    
    else:
        return ("Incomplete Request", 401)


@app.route("/user", endpoint='user')
@session_required
def user():
    cursor.execute("SELECT * FROM user WHERE user_id = %s", (session.get("user_id"),))
    user = cursor.fetchone()

    return user

@app.route("/user/update", methods=['POST'], endpoint='update_user')
@session_required
def update_user():
    data = request.get_json()

    if data.get("first_name") and data.get("last_name") and data.get("email") and data.get("phone_number") and data.get("address_line01") and data.get("address_city") and data.get("address_state") and data.get("address_zip_code") and data.get("address_country"):
        first_name = data.get("first_name")
        last_name = data.get("last_name")
        email = data.get("email")
        phone_number = data.get("phone_number")
        address_line01 = data.get("address_line01")
        address_city = data.get("address_city")
        address_state = data.get("address_state")
        address_zip_code = data.get("address_zip_code")
        address_country = data.get("address_country")

        cursor.execute("""
            UPDATE user
            SET first_name = %s,
            last_name = %s,
            email = %s,
            phone_number = %s,
            address_line01 = %s,
            address_city = %s,
            address_state = %s,
            address_zip_code = %s,
            address_country = %s
            WHERE user_id = %s
        """,
        (
            first_name,
            last_name,
            email,
            phone_number,
            address_line01,
            address_city,
            address_state,
            address_zip_code,
            address_country,
            session.get("user_id")
        ))
        connection.commit()

        return ("User Updated", 200)
    else:
        return ("Incomplete Request", 401)
    

@app.route("/user/orders", endpoint="user_orders")
@session_required
def user_orders():
    # print(session["user_id"])
    cursor.execute("SELECT * FROM `order` WHERE user_id = %s ORDER BY order_id DESC", (session.get("user_id"),))
    results = cursor.fetchall()

    return results


@app.route("/user/order", methods=["POST"], endpoint="user_order")
@session_required
def user_order():
    data = request.get_json()

    # print(data)

    if data.get("order_id"):
        cursor.execute("SELECT * FROM `order` WHERE order_id = %s", (data.get("order_id"),))
        result = cursor.fetchone()


        if result and result["user_id"] == session.get("user_id"):
            cart_id = result["cart_id"]
            # Query the database for the cart items
            cursor.execute("SELECT * FROM cart_item JOIN variant using(variant_id) JOIN product using(product_id) WHERE cart_id = (%s)", (cart_id, ))

            cart_items = []

            for cart_item in cursor.fetchall():
                # Return only the necessary details of the products in the cart
                modified_cart_item = {
                    "variant_id": cart_item["variant_id"],
                    "title": cart_item["title"],
                    "price": cart_item["price"],
                    "quantity": cart_item["quantity"],
                    "cart_item_id": cart_item["cart_item_id"]
                }
                cart_items.append(modified_cart_item)

            return_value = {
                "order_id": result["order_id"],
                "cart_items": cart_items,
                "estimated_delivery_date": result["est_delivery_days"],
            }

            return return_value
        else:
            return ("Unauthorized", 401)
    else:
        return ("Incomplete Request", 401)
    

@app.route("/admin/quarterly_report", methods=["POST"], endpoint='quarterly_report')
@admin_only
def quarterly_report():
    data = request.get_json()
    if (data.get("year")):
        year = data.get("year")
        cursor.callproc("quarterly_sales_reports_for_year", (year,))
        for result in cursor.stored_results():
            return_value = result.fetchall()
            # print(return_value)
            break

        return return_value

    else:
        return ("Incomplete Request", 401)
    
@app.route("/admin/most_sales", methods=["POST"], endpoint="most_sales")
@admin_only
def most_sales():
    data = request.get_json()
    # print(data)
    if data.get("start_date") and data.get("end_date"):
        cursor.execute("""
            SELECT product_id, title, sum(quantity) as total_sales
            FROM cart_item NATURAL JOIN variant JOIN product USING(product_id)
            WHERE sold_date BETWEEN %s AND %s
            GROUP BY product_id
            ORDER BY total_sales DESC
            LIMIT 10
        """,
        (data.get("start_date"), data.get("end_date")))

        results = cursor.fetchall()
        # for result in results:
            # print(result) 

        return (results, 200)
    
    else:
        return ("Incomplete Request", 401)
    
@app.route("/admin/most_orders_category", methods=["POST"], endpoint="most_orders_category")
@admin_only
def most_orders_category():
    data = request.get_json()
    # print(data)
    if data.get("start_date") and data.get("end_date"):
        cursor.execute("""
            SELECT psc.category_id, name as category, SUM(ci.quantity) as orderCount
            FROM Cart_Item ci
            INNER JOIN Variant v ON ci.variant_id = v.variant_id
            INNER JOIN Product p ON p.product_id = v.product_id
            INNER JOIN product_sub_category psc ON psc.product_id = p.product_id
            INNER JOIN Category c ON c.category_id = psc.category_id
            WHERE c.parent_category_id IS NOT NULL
            AND sold_date BETWEEN %s AND %s
            GROUP BY psc.category_id
            ORDER BY SUM(ci.quantity) DESC
            LIMIT 5
        """,
        (data.get("start_date"), data.get("end_date")))

        results = cursor.fetchall()
        # for result in results:
        #     print(result) 

        return (results, 200)
    
    else:
        return ("Incomplete Request", 401)
    

@app.route("/admin/monthly_orders", methods=["POST"], endpoint="monthly_orders")
@admin_only
def monthly_orders():
    data = request.get_json()
    if data.get("product_id"):
        # cursor.callproc("most_interest_month_for_product", (data.get("product_id"),))

        cursor.execute("SELECT most_interest_month_for_product(%s) as month", (data.get("product_id"),))

        results = cursor.fetchall()
        for result in results:
            if result is None:
                return ("No data", 404)

        return (results[0], 200)
    
    else:
        return ("Incomplete Request", 401)
    

@app.route("/admin/inventory", endpoint="inventory")
@inventory_access
def inventory():
    cursor.execute("SELECT * FROM variant NATURAL JOIN inventory JOIN product USING(product_id) ORDER BY quantity DESC")
    results = cursor.fetchall()
    # for result in results:
    #     print(result) 

    return (results, 200)


    

@app.route("/admin/orders", methods=["GET"], endpoint="orders")
@admin_only
def orders():
    cursor.execute("SELECT * FROM `order` ORDER BY order_id DESC")
    results = cursor.fetchall()

    return results    

# For debugging purposes, do not run in production!
if __name__ == '__main__':
    from werkzeug.serving import run_simple
    run_simple('localhost', 5000, app, use_reloader=True)