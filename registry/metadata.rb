name 'registry'
maintainer 'Tim Wieschalla'
maintainer_email 'tim.wieschalla@adesso.de'
license 'All rights reserved'
description 'wip'
# TODO check for readme?
# long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

depends 'docker'
depends 'docker_compose'

supports 'centos', '~> 7'

#berks install