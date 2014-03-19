#What I needz

#make sure I have puppet first?
 group { "puppet":
    ensure => "present",
 }

 file { '/etc/motd':
   content => "Welcome to your Vagrant-built virtual machine!
               Managed by Puppet.\n"
 }

#Lets start with me with some git?