class redis {

  package { 'redis-server': 
    ensure  => latest,
    require => Exec['make_update'],
  }

  service { 'redis-server':
    ensure  => running,
    enable  => true,
    require => Package['redis-server'],
  }

}