

ls
pwd

git --version

git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch ci-role_fromContainer
cd ProxyCookbook
ls
git status

git log -1 --pretty=%B



pwd
# show hidden files
ls -a

ruby -v
kitchen version
# bundle install
# kitchen list
KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen list
# KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen converge
#kitchen verify
