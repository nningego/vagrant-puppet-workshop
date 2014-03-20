#What I needz

#make sure I have puppet first?
 group { "puppet":
    ensure => "present",
 }

 file { '/etc/motd':
   content => "Welcome to your Vagrant-built virtual machine!
   Customize it to run your app with Puppet. NO CHEATING !\n"
 }

 file { "/etc/sudoers":
         owner => "root",
         group => "root",
         mode  => 440,
     }
