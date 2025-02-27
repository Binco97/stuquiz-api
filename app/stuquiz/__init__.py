# @author Simone Nicol <en0mia.dev@gmail.com>
# @created 22/05/23
import os
from flask import Flask
import toml


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=False)

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_file('../config.toml', load=toml.load)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    if 'MYSQL_PASSWORD' in os.environ:
        app.config['MYSQL_PASSWORD'] = os.environ['MYSQL_PASSWORD']

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    return app
