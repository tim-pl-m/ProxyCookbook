

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

KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen list
# KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen converge
KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen verify --color
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
# bash provision.sh
#
# bash kitchen_verify.sh
# echo -e "\033[42m Success \033[0m"
# # color needs: https://wiki.jenkins-ci.org/display/JENKINS/AnsiColor+Plugin
#
#
#
