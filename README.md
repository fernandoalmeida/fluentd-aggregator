# Description:

A base configuration for Fluentd data collector server

# Components

* fluentd: https://github.com/fluent/fluentd
* fluent-plugin-mongo: https://github.com/fluent/fluent-plugin-mongo
* heroku (optional): https://www.heroku.com/

# Requirement

* Ruby
* MongoDB

# Installation

## Local

    git clone https://github.com/fernandoalmeida/fluentd-agent.git
    bundle install
    bundle exec fluentd -c conf/fluent.rb -vv

### Test (local)

    curl http://localhost:8888/debug.test -d 'json={"json":"message"}'

## Heroku

    git clone https://github.com/fernandoalmeida/fluentd-agent.git
    heroku create [your-heroku-app-name]
    git push heroku master
    heroku addons:add mongolab

### Test (Heroku)

    curl http://[your-heroku-app-name].herokuapp.com/debug.test -d 'json={"json":"message"}'
    heroku logs
