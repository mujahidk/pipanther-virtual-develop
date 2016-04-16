class users {
  user { 'flask':
    ensure => 'present',
  }

  user { 'ghost':
    require => User['flask'],
    ensure => 'present',
    groups => ['sudo', 'flask'],
    home => '/home/ghost',
    managehome => true,
    password => '$6$lY2Gp3Cr$zNrUB7T3yibUF/gWn5cTQ0fNv7MUmx/DZuw3E7I..Vh9tITG28BtgvXJPU4Gm4Z/9oNvlbX24KzQ9Ib1QH1B9.',
    shell => '/bin/bash',
  }

  file { '/home/ghost':
    ensure => directory,
    owner => 'ghost',
    group => 'ghost',
    mode => 755,
    source => 'puppet:///modules/users/ghost',
    recurse => remote,
    require => User['ghost'],
  }

  ssh_authorized_key { 'ghost':
    ensure => 'present',
    user => 'ghost',
    type => 'rsa',
    key => '<your-public-key>',
  }
}
