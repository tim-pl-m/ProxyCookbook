

ls
git status





pwd
# show hidden files
ls -a

ruby -v
kitchen version

# kitchen list

whoami

# check if berkshelf installed
# sudo gem install berkshelf

#go to jenkins-cookbook
cd c/cj

bundle install

KITCHEN_LOCAL_YAML=.kitchen.docker_remote.yml kitchen list
KITCHEN_LOCAL_YAML=.kitchen.docker_remote.yml kitchen verify --color
# KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen destroy

#kitchen verify

# noop1

# ---
# # jenkins job "kitchen converge jenkins"
# set -x
# # to hide "echo"
#
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch ci-role_fromContainer --depth 1
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
# #TODO check if vagrant needed for docker
# #sudo gem install vagrant
# #vagrant -v
# echo -e "\033[43m start provisioning \033[0m"
#
# git clone https://github.com/tim-pl-m/bundler
# cd bundler
# rake build
# sudo gem install pkg/bundler-1.13.0.rc.1.gem
# bundle -v
# cd ..
## bash provision.sh
# kitchen -v
# kitchen list
#
# git clone https://github.com/tim-pl-m/test-kitchen
# cd test-kitchen
# rake build
# ls
# sudo gem install pkg/test-kitchen-1.10.2c.gem
# kitchen -v
# cd ..
# kitchen list
#
# bash kitchen_converge.sh
# echo -e "\033[42m Success \033[0m"
# # color needs: https://wiki.jenkins-ci.org/display/JENKINS/AnsiColor+Plugin
#
#--
#pwd
# ls
# cd ProxyCookbook
# git log -1 --pretty=%B --color
# bash kitchen_teardown.sh
