from flask import Flask, jsonify
import pyodbc

app = Flask(__name__)

# connects to my database
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=dist-6-505.uopnet.plymouth.ac.uk;'
    'DATABASE=COMP2001_DDawdry;'
    'UID=DDawdry;'
    'PWD=KlmN145'
)

@app.route('/users', methods=['GET'])
def get_users():
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM CW2.Users")
    users = cursor.fetchall()
    
    # convert to small list dictionary
    result = []
    for row in users:
        result.append({
            'UserID': row[0],
            'Username': row[1],
            'Email': row[2]
        })
    
    return jsonify(result)

@app.route('/')
def home():
    return "Profile Service is working!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)