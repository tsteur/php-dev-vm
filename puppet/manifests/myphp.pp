class myphp {

  include php

  package { 'php5-dev':
    ensure  => latest,
    require => Exec['make_update'],
  }

  package { 'curl':
    ensure  => latest,
    require => Exec['make_update'],
  }

  php::module { ['snmp', 'curl', 'xdebug', 'mysql', 'gd', 'sqlite', 'memcache', 'mcrypt', 'imagick', 'geoip', 'uuid', 'recode', 'cgi']: 
    require => Class["php::install", "php::config"],
  }

  php::conf { ['pdo', 'pdo_mysql', 'mysqli']:
    source  => 'puppet:///files/etc/php5/conf.d/',
    require => Class["php::install", "php::config"],
  }

  exec { 'install_composer':
    command => 'curl -s https://getcomposer.org/installer | php -- --install-dir="/bin"',
    require => [ Package['curl'], Class["php::install", "php::config"] ],
    unless  => 'which composer.phar',
  }

}