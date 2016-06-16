class { 'packer':
  version  => '0.10.0',
  base_url => 'https://releases.hashicorp.com/packer/0.10.0/',
}

class { 'docker': }

class { 'docker_compose': }

# class { 'ibs': }
