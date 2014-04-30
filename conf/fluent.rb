## built-in TCP input
## $ echo <json> | fluent-cat <tag>
source {
  type :forward
  port ENV['TCP_PORT'] || '24224'
}

# HTTP input
# http://localhost:8888/<tag>?json=<json>
source {
  type :http
  port ENV['HTTP_PORT'] || '8888'
}

# match tag=debug.** and dump to console
match ('debug.**') {
  type :stdout
}

# match all inputs and send to MongoDB
match ('**') {
  type :mongo
  user       ENV['MONGODB_USER']       if ENV['MONGODB_USER']
  password   ENV['MONGODB_PASSWORD']   if ENV['MONGODB_PASSWORD']
  host       ENV['MONGODB_HOST']       || 'localhost'
  port       ENV['MONGODB_PORT']       || '27017'
  database   ENV['MONGODB_DATABASE']   || 'fluentd'
  collection ENV['MONGODB_COLLeCTION'] || 'logs'
}
