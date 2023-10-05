import mysql.connector
import json


def get_database_connection():
    try:
        with open('db_config.json', 'r') as config_file:
            config = json.load(config_file)["database"]

    except FileNotFoundError:
        # Print error message and return None if the file is not found
        print("\n-------------------------------------\n")
        print("ERROR: Config file db_config.json not found\n")
        print("Follow these steps to fix this error:")
        print("1. Create a file named db_config.json in the same directory as this file")
        print("2. Copy the code from the db_config_template.json file and replace the ")
        print("   values with your own database credentials\n")
        print("----------------------------------------\n")

        exit()

        return None

    try:
        # Connect to the database
        db_connection = mysql.connector.connect(
            host=config["host"],
            user=config["user"],
            passwd=config["passwd"],
            database=config["database"]
        )

        if db_connection.is_connected():
            print("Connected to MySQL database")
            return db_connection

    except mysql.connector.Error as error:
        print("Error:", error)
        return None, None


def close_database_connection(connection):
    if connection.is_connected():
        connection.close()
        print("MySQL connection is closed")