# Description

A ‘log aggregators’ is a daemon that continuously receive events from the log forwarders.

![Fluentd Fowarder/Aggregator](http://docs.fluentd.org/images/fluentd_ha.png)

# Components

* fluentd: https://github.com/fluent/fluentd
* fluent-plugin-mongo: https://github.com/fluent/fluent-plugin-mongo

# Requirement

* Ruby
* MongoDB

# Installation

## Local

    git clone https://github.com/fernandoalmeida/fluentd-aggregator.git
    bundle install
    bundle exec fluentd -c conf/fluent.rb -vv

## Vagrant VirtualBox VM

    git clone https://github.com/fernandoalmeida/fluentd-aggregator.git
    git submodules init
    git submodules update
    vagrant up

    vagrant ssh
    cd ~/fluentd-aggregator
    bundle install

    bundle exec fluentd -c conf/fluent.rb -vv

### Test

    curl http://localhost:8888/debug.test  -d 'json={"json":"message"}'
    curl http://localhost:8888/myapp.event -d 'json={"login":{"user":"1"}}'
