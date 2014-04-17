group { "puppet":
  ensure => "present",
}

file { '/etc/motd':
  content => "Welcome to your Vagrant-built virtual machine!
   Customize it to run your app with Puppet. NO CHEATING !\n"
}

file { '.bashrc':
  path => '/home/vagrant/.bashrc',
  ensure => present,
  source => '/vagrant/manifests/files/.bashrc'
}
