## built-in TCP input
## $ echo <json> | fluent-cat <tag>
source {
  type :forward
}

# HTTP input
# http://localhost:8888/<tag>?json=<json>
source {
  type :http
  port ENV['PORT'] || '8888'
}

# match tag=debug.** and dump to console
match ('debug.**') {
  type :stdout
}

# match all inputs and send to MongoDB
match ('**') {
  regex = /mongodb:\/\/([^:]+):([^@]+)@([^:]+):(\d+)\/(.+)/
  uri = ENV['MONGOLAB_URI']
  m = regex.match(uri).to_a

  type :mongo
  user       m[1] if m[1]
  password   m[2] if m[2]
  host       m[3] || 'localhost'
  port       m[4] || '27017'
  database   m[5] || 'fluentd'
  collection :logs
}
