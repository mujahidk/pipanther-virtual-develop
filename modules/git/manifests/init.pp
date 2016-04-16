class git{
  include git::install
}

class git::install{
  package { 'git:':
      ensure => present
  }
}

define git::clone ($path, $dir, $user){
    exec { "clone-$name-$path":
        command => "/usr/bin/git clone https://github.com/$name $path/$dir",
        creates => "$path/$dir",
        user => "$user",
        require => [Class["git"], File[$path]],
    }
}
