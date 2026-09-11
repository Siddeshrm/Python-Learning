
"""Flask is a web frame work, API testing 
app.route('/'): whenever you hit the api automatically that function will run 
app.route('/<method>'): you need to hit the method name to run that function
"""

from flask import Flask,request

app = Flask(__name__)

@app.route('/')

def greet():
    return("hello")

@app.route('/Siddesh',methods=["Get"])
def greet1():
    return("good morning")

@app.route('/Siddu',methods=["Get"])  # Poste quiry or Post API will not work in the google. it will work in postman only
def greet2():
    n1=10
    n2=20
    return([int(n1)+int(n2)])

@app.route('/addition',methods=["Get"])
def addition():
    num1=request.args.get("num1")
    num2=request.args.get("num2")
    num3=request.args.get("num3")
    return([int(num1)+int(num2)+int(num3)])

if __name__=='__main__':
    app.run(host='0.0.0.0',port=8000)


# port numbers:- 8000, 8888, 5000