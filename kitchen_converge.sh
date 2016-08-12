
pwd
# show hidden files
ls -a

# bundle install

ruby -v

puppet --version

kitchen version
kitchen list
kitchen converge
#kitchen verify

# ---
# job "kitchen converge jenkins"
#
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch ci-role_fromContainer --depth 1
# ls
# cd ProxyCookbook
# git log -1 --pretty=%B
# #gem install berkshelf
# #bundle install
# bash kitchen_converge.sh
# #bash kitchen_verify.sh
# #bash run_jenkins_slave.sh
# -
# pwd
# ls
# cd ProxyCookbook
# git log -1 --pretty=%B
# bash kitchen_teardown.sh
# ----
# # jenkins job "kitchen converge docker centos"
# set +x
# # to hide "echo"
#
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch _blueprint
# ls
# cd ProxyCookbook
# ls
# git log -1 --color
# #git log -1 --pretty=%B
# #gem install berkshelf
#
#
# vboxmanage --version
#
# #source ~/.bash_profile
# #source /etc/profile.d/rvm.sh
#
# ruby -v
# #gem install test-kitchen
# kitchen -v
# #gem install bundler
# bundler -v
# #gem install vagrant
# vagrant -v
# echo -e "\033[43m start provisioning \033[0m"
# bash provision.sh
# echo -e "\033[42m finished provisioning \033[0m"
#
# #bash kitchen_converge.sh
# echo -e "\033[42m Success \033[0m"
# # color needs: https://wiki.jenkins-ci.org/display/JENKINS/AnsiColor+Plugin
# ---
# jenkins job "kitchen converge jenkins"
# set +x
# # to hide "echo"
#
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch _blueprint
# ls
# cd ProxyCookbook
# ls
# git log -1
# #git log -1 --pretty=%B
# #gem install berkshelf
#
#
# #vboxmanage --version
#
# #source ~/.bash_profile
# #source /etc/profile.d/rvm.sh
#
# ruby -v
# #gem install test-kitchen
# kitchen -v
# #gem install bundler
# bundler -v
# #gem install vagrant
# #vagrant -v
# echo -e "\033[43m start provisioning \033[0m"
#
# git clone https://github.com/tim-pl-m/bundler
# cd bundler
# rake build
# sudo gem install pkg/bundler-1.13.0.rc.1.gem
# bundle -v
# bash provision.sh
#
# #bash kitchen_converge.sh
# echo -e "\033[42m Success \033[0m"
# # color needs: https://wiki.jenkins-ci.org/display/JENKINS/AnsiColor+Plugin
#
#
# --
# pwd
# ls
# cd ProxyCookbook
# git log -1 --pretty=%B
# bash kitchen_teardown.sh

# ----
# # jenkins job "check docker server"
# # test if docker-server is running:
# curl http://10.11.16.151:4243
# # should give "404 page not found"
# # some server information:
# date +"Time: %T"
# # TODO doesnt work as jenkins-user
# #df /dev/sda6 -H
# df
# # http://www.cyberciti.biz/faq/linux-command-space-left-on-hard-disk-drive/ :)
# # cat /proc/meminfo
# egrep --color 'Mem|Cache|Swap' /proc/meminfo
# # http://www.cyberciti.biz/faq/linux-check-memory-usage/
#
# ---
# ruby:
# # ubuntu:
# # sudo apt-add-repository ppa:brightbox/ruby-ng -y
# # sudo apt-get update
# # sudo apt-get install ruby2.1.8 -y
# # ruby -v
# centos:
# cat /etc/redhat-release
# (yum install ruby2.1.8)
# yum install ruby
#
# gem install test-kitchen
# gem install bundler

# kitchen:
# ...
# ---

# ---
#
# virtualbox:
# wget http://download.virtualbox.org/virtualbox/5.0.16/virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
# sudo dpkg -i virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
#
# sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
# sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list'
# wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
# sudo apt-key add oracle_vbox.asc
# sudo apt-get install -y virtualbox-5.0.16
# ?!
#
# vagrant:
# sudo apt-get install vagrant
# ?!
#
# ---

# rvm centos:
# yum install curl -y
# command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
# curl -L get.rvm.io | bash -s stable
# source /etc/profile.d/rvm.sh
# ? rvm install current && rvm use current
# rvm install 2.1.6 && rvm use 2.1.6
#
# vagrant centos:
# (wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm)
# yum install https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm -y


# ----
# # jenkins job "kitchen converge docker ubuntu"
# set +x
# # to hide "echo"
#
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch _blueprint
# ls
# cd ProxyCookbook
# ls
# git log -1 --color
# #git log -1 --pretty=%B
# #gem install berkshelf
#
#
# #vboxmanage --version
#
# #source ~/.bash_profile
# #source /etc/profile.d/rvm.sh
#
# ruby -v
# #gem install test-kitchen
# kitchen -v
# #gem install bundler
# bundler -v
# #gem install vagrant
# #vagrant -v
# echo -e "\033[43m start provisioning \033[0m"
#
# git clone https://github.com/tim-pl-m/bundler
# cd bundler
# rake build
# sudo gem install pkg/bundler-1.13.0.rc.1.gem
# bundle -v
# bash provision.sh
#
# #bash kitchen_converge.sh
# echo -e "\033[42m Success \033[0m"
# # color needs: https://wiki.jenkins-ci.org/display/JENKINS/AnsiColor+Plugin
#
#
#
#
#
#
