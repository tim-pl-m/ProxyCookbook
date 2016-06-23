# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM ubuntu:trusty
MAINTAINER Ervin Varga <ervin.varga@gmail.com>

# In case you need proxy
#RUN echo 'Acquire::http::Proxy "http://127.0.0.1:8080";' >> /etc/apt/apt.conf

# Add locales after locale-gen as needed
# Upgrade packages on image
# Preparations for sshd
run locale-gen en_US.UTF-8 &&\
    apt-get -q update &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q upgrade -y -o Dpkg::Options::="--force-confnew" --no-install-recommends &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends openssh-server &&\
    apt-get -q autoremove &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin &&\
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
    mkdir -p /var/run/sshd

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install JDK 7 (latest edition)
RUN apt-get -q update &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends openjdk-7-jre-headless &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

# Set user jenkins to the image
RUN useradd -m -d /home/jenkins -s /bin/sh jenkins &&\
    echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

# Default command
CMD ["/usr/sbin/sshd", "-D"]

# credits: evarga/jenkins-slave
# ------------------
# from here: timplm/jenkins-slave

(sudo apt-get update)

sudo apt-get install curl -y

# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# \curl -sSL https://get.rvm.io | bash -s stable --rails
# source ~/.rvm/scripts/rvm
# rvm install ruby-2.1.6 && use ruby-2.1.6
# source /usr/local/rvm/scripts/rvm

apt-get install software-properties-common -y
sudo apt-add-repository ppa:brightbox/ruby-ng -y
sudo apt-get update
sudo apt-get install ruby2.1 -y

rvm

ruby -v
  
gem install test-kitchen
gem install bundler

# ERROR: Failed to build gem native extension.
# fix:
apt-get install make -y
sudo apt-get install ruby2.1-dev -y
# ? apt-get install -y ruby-dep-selector
gem install berkshelf
