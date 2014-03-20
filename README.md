download and install vagrant
vagrant plugin install vagrant-librarian-puppet
ssh-add ~/.ssh/id_rsa

vagrant up
vagrant ssh
cd /vagrant/vagrant-puppet-workshop
bundle install
ruby runApp.rb