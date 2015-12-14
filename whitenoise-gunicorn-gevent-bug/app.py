import os

import falcon
from whitenoise import WhiteNoise

ROOT = os.path.dirname(os.path.abspath(__file__))

app = falcon.API()
app = WhiteNoise(app, root=os.path.join(ROOT, 'static'), prefix='static/')

