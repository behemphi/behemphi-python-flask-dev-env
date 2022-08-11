import json
from app import app
from flask import jsonify

@app.route('/')
@app.route('/index')
def index():
    return "Hello Tackle World!"

books = [
    {
        "id": 1,
        "title": "CS50",
        "description": "Intro to CS and art of programming!",
        "author": "Havard",
        "borrowed": False
    },
    {
        "id": 2,
        "title": "Python 101",
        "description": "little python code book.",
        "author": "Will",
        "borrowed": False
    }
]

@app.route("/bookapi/books")
def get_books():
    """ function to get all books """
    return jsonify({"Books": books})


def test_get_all_books():
    response = app.test_client().get('/bookapi/books')
    res = json.loads(response.data.decode('utf-8')).get("Books")
    assert type(res[0]) is dict
    assert type(res[1]) is dict
    assert res[0]['author'] == 'Havard'
    assert res[1]['author'] == 'Will'
    assert response.status_code == 200
    assert type(res) is list

def test_cause_failed_test():
    assert 0 == 1

