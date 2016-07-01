# ----
# jenkins commands:
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch _blueprint
# git log -1 --pretty=%B
# cd ProxyCookbook
# bash kitchen_converge.sh
# ----

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
# kitchen converge
#kitchen verify

