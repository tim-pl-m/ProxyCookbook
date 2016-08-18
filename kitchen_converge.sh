#!/bin/bash
set -x

pwd
# show hidden files
ls -a

# bundle install

ruby -v

puppet --version

kitchen version
kitchen list

#check if docker available
docker -v

echo -e "\033[43m check if vbox available; has to be 5.0.16r105871 \033[0m"
vboxmanage -v

#kitchen converge --color
#kitchen verify

# ---
# cat /etc/issue
# cat /etc/redhat-release
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
#without rvm
# cat /etc/redhat-release
# (?yum install ruby2.1.8)
# ---
# yum --enablerepo=epel -y install libyaml libyaml-devel readline-devel ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel libffi-devel
# mkdir -p rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
# wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.8.tar.gz -P rpmbuild/SOURCES
# tar -xvzf ruby-2.1.8.tar.gz
# ./configure
# make
# make install
#
# with rvm:
# su jenkins
# gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# curl -sSL https://get.rvm.io | bash -s stable
# source /etc/profile.d/rvm.sh
# rvm requirements
# rvm install ruby-2.1.8 && rvm use ruby-2.1.8
# ruby -v
#
# TODO fix rvm-jenkins problem
# echo "source $HOME/.rvm/scripts/rvm" >> ~/.bashrc
# source ~/.bashrc
# source /home/jenkins/.rvm/scripts/rvm
# vi ~/.bashrc
# echo "/usr/local/bin" >> ~/.bashrc
#
# ---

# kitchen+bundler+vagrant:
# gem install bundler
# gem install test-kitchen
# kitchen -v
# ---

# ---
#
# virtualbox:
# ubuntu:
# wget http://download.virtualbox.org/virtualbox/5.0.16/virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
# sudo dpkg -i virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb
#
# sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
# sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list'
# wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
# sudo apt-key add oracle_vbox.asc
# sudo apt-get install -y virtualbox-5.0.16
# ?!
---
# centos:
# yum install wget -y
# cd /etc/yum.repos.d
# wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
# yum update -y
# rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-7.noarch.rpm
# yum --enablerepo=epel install dkms -y
# yum groupinstall "Development Tools" -y
# yum install kernel-devel -y
# yum install http://download.virtualbox.org/virtualbox/5.0.16/VirtualBox-5.0-5.0.16_105871_el6-1.x86_64.rpm -y
#
# yum install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-PAE-devel dkms -y
#
# sudo /sbin/rcvboxdrv setup
# vboxmanage --version
#
# yum remove VirtualBox*
# yum install VirtualBox
#
# -
#
# wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm
# yum localinstall vagrant_1.8.1_x86_64.rpm
# ---
# ubuntu:
#
# vagrant:
# sudo apt-get install vagrant
# /

# ?!
# vagrant -v
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
