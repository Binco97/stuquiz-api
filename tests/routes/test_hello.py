# @author Simone Nicol <en0mia.dev@gmail.com>
# @created 22/05/23
import unittest
import flaskr


class Hello(unittest.TestCase):

    def setUp(self):
        app = flaskr.create_app()
        app.testing = True
        self.app = app.test_client()

    def test_home(self):
        result = self.app.get('/hello')
        self.assertEqual(result.status_code, 200)
