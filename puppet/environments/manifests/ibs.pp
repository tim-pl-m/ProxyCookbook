class { 'packer':
  version  => '0.8.5',
  # version  => '0.10.0',
  # base_url => 'https://releases.hashicorp.com/packer/0.10.0/',
}

class { 'docker':
  version  => '1.7.1',
}

class { 'docker_compose':
  version  => '1.4.0',
}

# class { 'ibs': }
