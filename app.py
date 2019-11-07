from flask import Flask
import time

app = Flask(__name__)


@app.route("/exception")
def exception():
    time.sleep(0.2)
    raise Exception('Sample Exception') # throwing exception
    


@app.route("/")
def hello():
    time.sleep(1)
    return "Hello there!"


if __name__ == "__main__":
    app.run(host='0.0.0.0')
