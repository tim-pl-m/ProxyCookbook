class ibs {
  include 'docker'

  file { ['/opt/docker', '/opt/docker/registry', '/opt/docker/registry/data']:
    ensure => directory,
  }

  file { '/opt/docker/registry/docker-compose.yaml':
    content => template('ibs/docker-compose.yaml.erb'), 
    require => File['/opt/docker/registry'],
  }

  exec { 'run registry':
    command => 'docker-compose up -d',
    cwd     => '/opt/docker/registry',
    path    => ['/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin'],
    require => File['/opt/docker/registry'],
  }

  ibs::clone_to_registry { 'centos':
    version => '6.7'
  }
}
