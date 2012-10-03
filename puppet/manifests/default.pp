Exec {
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'make_update':
  command => 'sudo apt-get update',
}

package { ['vim', 'facter', 'percona-toolkit', 'git-core', 'subversion', 'apache2-utils', 'strace', 'tcpdump', 'wget']:
  ensure  => latest,
  require => Exec['make_update'],
}

class { 'db':
  db_root_password => $db_root_password,
  db_name     => $db_name,
  db_username => $db_username,
  db_password => $db_password,
}

include myphp
include redis
include memcache

host { $project_url:
  ip => $ipaddress_eth1,
} 

class { 'apache':  }
class { 'apache::mod::php': }

apache::vhost { $project_url:
  priority    => '10',
  docroot     => $project_dir,
  vhost_name  => $ipaddress_eth1,
  port        => '80',
}