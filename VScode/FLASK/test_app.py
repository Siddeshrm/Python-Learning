from flask import Flask, request

app = Flask(__name__)


@app.route('/', methods=["Post"])
def welcome():
    return('hai good morning')


@app.route('/greet', methods=["Get"])
def greet():
    return('hello')


@app.route('/addition1', methods=["Get"])
def addition1():
    num1 = 10
    num2 = 20
    return([num1 + num2])


@app.route('/addition2', methods=["Get"])
def addition2():
    num1 = request.args.get("num1")
    num2 = request.args.get("num2")
    return([int(num1) + int(num2)])


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)