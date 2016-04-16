class flask {
	include flask::install
}

class flask::install{
	package { [ "python", "python-virtualenv", "python-pip", "nodejs", "npm" ]:
    	ensure => present
  	}
}

define flask::virtualenv($path, $user){
    exec { "create-ve-$path":
		command => "/usr/bin/virtualenv -q $name",
		cwd => $path,
		creates => "$path/$name",
		user => "$user",
		require => [Class["flask::install"]],
    }
}
