
# ----
# jenkins commands:
# ls
# pwd
#
# git --version
#
# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch ci-role_fromContainer
# git log -1 --pretty=%B
# cd ProxyCookbook
# bash kitchen.sh
# ----

ls
git status





pwd
# show hidden files
ls -a

ruby -v
kitchen version

# kitchen list


# check if berkshelf installed
# TODO: fix sudo error
# sudo gem install berkshelf

#go to jenkins-cookbook
# cd c/cj

# TODO: fix sudo error
# bundle install

KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen list
KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen converge

#kitchen verify

# noop1