import os, json
from flask import Flask
from pymongo import MongoClient

app = Flask(__name__)
env_username = os.getenv("MONGO_USERNAME","admin")
env_password = os.getenv("MONGO_PASSWORD","password")
env_server = os.getenv("MONGO_SERVER","localhost")

connstr = f"mongodb://{env_username}:{env_password}@{env_server}:27017"
print('a-%s b-%s c-%s d-%s' % (env_username, env_password, env_server, connstr))

client = MongoClient(connstr)
db = client.demodb
collect = db.data1

@app.route("/")
def default():
    return "I'm Flask...!"

@app.route("/init")
def initDB():
    doc = [
        {"name": "홍길동", "age": 27},
        {"name": "이순신", "age": 45},
        {"name": "김유신", "age": 27},
    ]
    collect.insert_many(doc)
    return "document created"

@app.route("/list")
def listingDB():
    collections = db.list_collection_names()
    collections_str = json.dumps(collections)

    documents = collect.find({"age": 27})
    documents_str = json.dumps( [doc["name"] for doc in documents], ensure_ascii = False)

    return f"collections: {collections_str}<br>documents: {documents_str}"

if __name__ == "__main__":
   app.run(host="0.0.0.0", port=5000, debug=True)
