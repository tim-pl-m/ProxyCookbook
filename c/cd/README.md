# ciexjenkinsdokcer cookbook

wip:
-firewall and jenkins-slave-config-deactivated
-converges with vagrant on linux

This cookbook is a wrapper for the docker cookbook from official supermarket.
It installs/configures docker and its daemon and builds a docker image for jenkins slaves by default.

## Dependencies

 - cookbook `docker: This is the

## Supported Platforms

**CentOS 7**

 More specifically, the [adesso/centos7](http://box.adesso.de/centos7.json) box found at [http://boxes.adesso.de](http://boxes.adesso.de).

## Attributes

 - `default['ciexdocker']['version']` - The version of the docker daemon to install. Defaults to `1.6.0-11.0.1.el7.centos`.
 - `default['ciexdocker']['listen_address']` - IP address that docker listens for TCP requests - Defaults to `0.0.0.0`
 - `default['ciexdocker']['listen_port']` -  port docker listens on for TCP requests - Defaults to `4243`
  - `default['ciexdocker']['allowed_api_client_ip']` -  ip of the api client, e.g. the jenkins master - Defaults to `0.0.0.0/0`

## Recipes

### ::install

The `::install` recipe installs the docker service and provides a base images. The base image is configured as a Jenkins slave.

## License and Authors

Author:: Max Edenharter (max.edenharter@adesso.de)
