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

class { '::mysql::server':
  root_password    => 'thought',
  override_options => { 'mysqld' => { 'max_connections' => '1024', 'bind_address' => '0.0.0.0' } }
}

mysql_database { 'miniondb':
  ensure  => 'present',
  charset => 'utf8',
}

mysql_grant { 'root@localhost/*.*':
ensure     => 'present',
options    => ['GRANT'],
privileges => ['ALL'],
table      => '*.*',
user       => 'root@localhost',
}



