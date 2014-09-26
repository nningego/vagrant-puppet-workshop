group { "puppet":
  ensure => "present",
}

file { '/etc/motd':
  content => "Welcome to your Vagrant-built virtual machine!
   Customize it to run your app with Puppet. NO CHEATING !\n"
}

exec { "apt-update":
  command => "/usr/bin/apt-get -y update"
}

file { '.bashrc':
  path => '/home/vagrant/.bashrc',
  ensure => present,
  source => '/vagrant/manifests/files/.bashrc'
}

rbenv::install { "vagrant":
  group => 'vagrant',
  home  => '/home/vagrant',
  rc    => '.bashrc',
}

rbenv::compile { "2.1.1":
  user => "vagrant",
  home => "/home/vagrant",
}

#binding address needs to be overriden to access mysql from outside
class { '::mysql::server':
  root_password    => 'thought',
  override_options => { 'mysqld' => { 'max_connections' => '1024', 'bind_address' => '0.0.0.0' } }
}

#add permissions for incoming connection 10.2.2.2
mysql::db { 'miniondb':
  user     => 'root',
  password => 'thought',
  host     => '10.0.2.2',
  grant    => ['ALL'],
}


