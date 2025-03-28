import psycopg2
import json

def load_cred():
    with open("./credentials.json", "r") as f:
        cred = json.load(f)

    return cred

def connect_db():
    cred = load_cred()
    conn = psycopg2.connect(user=cred["username"], host=cred["host"], port=cred["port"], database=cred["database"], password=cred["password"])
    curr = conn.cursor()

    return conn, curr

def close_db(conn):
    conn.close()
