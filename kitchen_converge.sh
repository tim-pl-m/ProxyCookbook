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
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch _blueprint --depth 1
# ls
# cd ProxyCookbook
# git log -1 --pretty=%B
# #gem install berkshelf
# #bundle install
#
# #bash kitchen_converge.sh
# kitchen -v
# ruby -v
# vagrant -v
# ---
# jenkins job "kitchen converge docker ubuntu"
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch _blueprint --depth 1
# git log -1 --pretty=%B
# cd ProxyCookbook
# bash kitchen_converge.sh
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



pwd
# show hidden files
ls -a

# bundle install

ruby -v
kitchen version
kitchen list
kitchen converge
#kitchen verify

