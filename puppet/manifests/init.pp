Exec {
  path => $path,
}

include mongodb

class {"rbenv-ruby":
  user    => "vagrant",
  version => "2.0.0-p247",
}
