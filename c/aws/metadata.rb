name 'ciexdocker'
maintainer 'Max Edenharter'
maintainer_email 'max.edenharter@adesso.de'
license 'All rights reserved'
description 'Installs/Configures docker to serve as Jenkins slave'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version '0.1.1'

recipe 'ciexdocker::install', 'installs/configures docker'

# depends 'docker', '~> 2.0'
depends 'docker', '=1.0.29'
depends 'firewall', '= 2.0.3'
