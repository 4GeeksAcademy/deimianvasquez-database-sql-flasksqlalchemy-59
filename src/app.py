"""
This module takes care of starting the API Server, Loading the DB and Adding the endpoints
"""
import os
from flask import Flask, request, jsonify, url_for
from flask_migrate import Migrate
from flask_swagger import swagger
from flask_cors import CORS
from utils import APIException, generate_sitemap
from admin import setup_admin
from models import db, User
from sqlalchemy import select
# from models import Person

app = Flask(__name__)
app.url_map.strict_slashes = False

db_url = os.getenv("DATABASE_URL")
if db_url is not None:
    app.config['SQLALCHEMY_DATABASE_URI'] = db_url.replace(
        "postgres://", "postgresql://")
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:////tmp/test.db"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

MIGRATE = Migrate(app, db)
db.init_app(app)
CORS(app)
setup_admin(app)

# Handle/serialize errors like a JSON object


@app.errorhandler(APIException)
def handle_invalid_usage(error):
    return jsonify(error.to_dict()), error.status_code

# generate sitemap with all your endpoints


@app.route('/')
def sitemap():
    return generate_sitemap(app)


@app.route('/user', methods=['GET'])
def handle_hello():
    # users = User.query.all()
    users = db.session.execute(select(User)).scalars().all()

    users = list(map(lambda item: item.serialize(), users))

    return jsonify(users), 200


@app.route("/user", methods=["POST"])
def add_new_user():
    body = request.get_json()
    if body is None:
        return jsonify({"message": "You need tu specify the request body as a json object"})

    if "email" not in body:
        return jsonify({"message": "You need specify the email"})

    if body.get("password") is None:
        return jsonify({"message": "You need specify the password"})

    user = User.query.filter_by(email=body["email"]).first()

    if user is not None:
        return jsonify({"message": "User exist"}), 400

    user = User(email=body["email"], password=body["password"])

    db.session.add(user)
    try:
        db.session.commit()
        return jsonify({"message": "Your user save successfully"}), 201
    except Exception as err:
        db.session.rollback()
        return jsonify({"message": f"Error {err.args}"}), 500


# this only runs if `$ python src/app.py` is executed
if __name__ == '__main__':
    PORT = int(os.environ.get('PORT', 3000))
    app.run(host='0.0.0.0', port=PORT, debug=False)
