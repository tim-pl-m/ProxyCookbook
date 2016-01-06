#!/bin/bash

# until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:8080 | grep 'Coyote'`" != "" ];
until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:8080 | grep '302 Found'`" != "" ];
# 302 Found
# source: http://stackoverflow.com/questions/376279/wait-until-tomcat-finishes-starting-up
do
  echo --- sleeping for 10 seconds
  sleep 10
done

echo Jenkins is ready!
