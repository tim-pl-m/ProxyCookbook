define ibs::clone_to_registry
(
  $version  = 'latest',
  $server   = 'localhost',
  $port     = '5000',
) {
  $image = $name

  Exec {
    path => ['/bin', '/usr/bin', '/usr/local/bin', '/usr/sbin'],
  }

  exec { "download docker image: ${image}:${version}":
    command => "docker pull ${image}:${version}",
  }

  exec { "tag image: ${image}:${version}":
    command => "docker tag --force \$(docker images | grep ^${image} | grep ${version} |\
      awk '{print \$3}') ${server}:${port}/${image}:${version}",
    require => Exec["download docker image: ${image}:${version}"],
  }

  exec { "push image to private registry: ${image}:${version}":
    command => "docker push ${server}:${port}/${image}:${version}",
    require => Exec["tag image: ${image}:${version}"],
  }
}
