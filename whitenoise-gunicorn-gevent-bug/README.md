# Bug in gunicorn gevent worker

Showcase a bug in Gunicorn 19.4 in gevent worker when serving static
files via whitenoise.

Automated docker image can be found here:
https://hub.docker.com/r/slafs/whitenoise-test/

## Steps to reproduce the bug

* With docker:

  * `docker run -d --name gevent-worker -p 9999:9999 slafs/whitenoise-test`

* Without docker (this can be observed on CentOS 6):

  * Clone the repo and go to `whitenoise-gunicorn-gevent-bug` dir.
  * Create a virtualenv and activate it.
  * Install dependencies in it (via `pip install -r requirements.txt`).
  * Run the app with `gunicorn -b 0.0.0.0:9999 -k gevent app:app`.

Now run `curl http://127.0.0.1:9999/static/example > /dev/null` several times.

You should observe `transfer closed with xxxxx bytes remaining to read`
error messages from curl.

