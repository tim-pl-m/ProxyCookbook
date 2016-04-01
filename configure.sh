#ruby -v
#sudo apt-get update

sudo apt-get install build-essential make curl -y
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -L https://get.rvm.io | bash -s stable

#source ~/.bash_profile
#. ~/.bash_profile

which ruby
echo $HOME
echo $PATH
#export PATH=$PATH:/home/ubuntu/.rvm/gems/ruby-2.1.4/bin:/home/ubuntu/.rvm/gems/ruby-2.1.4@global/bin:/home/ubuntu/.rvm/rubies/ruby-2.1.4/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ubuntu/.rvm/bin:/home/ubuntu/.rvm/bin
export PATH=/home/ubuntu/.rvm/gems/ruby-2.1.4/bin:/home/ubuntu/.rvm/gems/ruby-2.1.4@global/bin:/home/ubuntu/.rvm/rubies/ruby-2.1.4/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ubuntu/.rvm/bin:/home/ubuntu/.rvm/bin
echo $PATH
#rvm
#rvm install ruby-2.1.4
rvm list
whoami
#rvm use --default ruby-2.1.4
rvm use ruby-2.1.4
#$HOME/.rvm/rubies export PATH=$PATH:$HOME/.rvm/rubies/ruby-2.1.4/bin
ruby -v

# sudo apt-get install docker.io -y
# sudo docker version
# 
# #sudo groupadd docker
# #sudo gpasswd -a ${USER} docker
# 
# #sudo usermod -a -G docker ubuntu
# sudo usermod -aG docker ubuntu
# 
# sudo newgrp docker
# #relog!
# #docker ps
# docker version
