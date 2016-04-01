#Dockerfile
FROM timplm/jenkins:latest
#EXPOSE 8080
#RUN /etc/init.d/jenkins start
#CMD ["/etc/init.d/jenkins start"]
#CMD ["/etc/init.d/jenkins","start"]
#ENTRYPOINT ["/etc/init.d/jenkins","-c","start"]
#CMD ["/usr/sbin/sshd","-D","-o"]
#ENTRYPOINT ["/usr/sbin/sshd -D -o"]
#CMD ["/usr/sbin/sshd -D -o","/etc/init.d/jenkins start"]
#CMD ["/bin/ping","localhost"]
CMD  /etc/init.d/jenkins start;  tail -f /var/log/jenkins/jenkins.log
