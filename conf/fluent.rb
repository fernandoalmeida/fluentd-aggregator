## built-in TCP input
## $ echo <json> | fluent-cat <tag>
source {
  type :forward
}

# HTTP input
# http://localhost:8888/<tag>?json=<json>
source {
  type :http
  port "#{::ENV['PORT'] || 8888}"
}

# match tag=debug.** and dump to console
match ('debug.**') {
  type :stdout
}
