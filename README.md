## Local

    $ git clone https://github.com/fernandoalmeida/fluentd-agent.git
    $ bundle install
    $ bundle exec fluentd -c conf/fluent.rb -vv

### Test (local)

    $ curl http://localhost:8888/debug.test -d 'json={"json":"message"}'

## Heroku

    $ heroku create
    $ git push heroku master

### Test (Heroku)

    $ curl http://[your-heroku-app-name].herokuapp.com/debug.test -d 'json={"json":"message"}'
    $ heroku logs
