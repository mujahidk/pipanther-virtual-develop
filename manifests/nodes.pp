node default {
  include users
  include ssh
  include git
  include flask
}

file { '/usr/local/app':
    ensure => directory,
    owner => 'ghost',
    group => 'flask',
    mode => 755,
}

git::clone { 'mujahidk/pipanther':
    path => '/usr/local/app',
    dir => 'pipanther',
    user => 'ghost',
}

flask::virtualenv { 'venv':
	path => '/usr/local/app/pipanther',
	user => 'ghost',
}
