name 'ciexjenkins'
maintainer 'Max Edenharter'
maintainer_email 'max.edenharter@adesso.de'
license 'All rights reserved'
description 'Configures a Jenkins service with Docker slave support'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

# depends 'java', '= 1.31.0'
depends 'java'
depends 'jenkins', '= 2.4.1'

recipe 'master', 'Installs and configures a Jenkins master node'
recipe 'ad', 'Installs Active Directory plugin and configures it'
recipe 'plugins', 'Installs all defined plugins.'

supports 'centos', '~> 7'
