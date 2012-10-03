class memcache {
  package { 'memcached': 
    ensure   => latest,
    require  => Exec['make_update'],
  }

  service { "memcached":
    ensure  => running,
    enable  => true,
    require => Package['memcached'];
  }

}