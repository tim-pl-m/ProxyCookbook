#run_jenkins_slave.sh
git version
java -version
docker version
ruby -v

#docker stop $(docker ps -a)

# git clone https://github.com/tim-pl-m/ProxyCookbook.git --branch aws_slave
#cd ProxyCookbook/c/cj

cd c/cj
#cd c/ci-role
pwd
ls
#source ~/.bash_profile
export PATH=/home/ubuntu/.rvm/gems/ruby-2.1.4/bin:/home/ubuntu/.rvm/gems/ruby-2.1.4@global/bin:/home/ubuntu/.rvm/rubies/ruby-2.1.4/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ubuntu/.rvm/bin:/home/ubuntu/.rvm/bin
rvm use --default ruby-2.1.4
ruby -v
gem install berkshelf
#berks install
gem install test-kitchen
gem install kitchen-docker
kitchen
#bundle install
docker ps
#docker pull timplm/jenkins
#kitchen list
#KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen destroy
docker stop $(docker ps -a -q)
docker ps
KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen converge
# KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen verify
#KITCHEN_LOCAL_YAML=.kitchen.docker.yml kitchen test
