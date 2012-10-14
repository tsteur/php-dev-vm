class myphp {

  include php

  package { 'php5-dev':
    ensure  => latest,
    require => Exec['make_update'],
  }

  package { ['libgv-php5', 'graphviz']:
    ensure  => latest,
    require => Exec['make_update'],
  }

  package { 'curl':
    ensure  => latest,
    require => Exec['make_update'],
  }

  php::module { ['snmp', 'curl', 'xdebug', 'mysql', 'gd', 'memcache', 'mcrypt', 'imagick', 'geoip', 'uuid', 'recode', 'cgi']: 
    require => Class["php::install", "php::config"],
  }

  php::module { 'sqlite':
    source  => 'puppet:///files/etc/php5/conf.d/',
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

  class { 'pear': require => Class['php::install'] }
  class { 'phpqatools': require => Class['pear'] }

  pear::package { "PHPUnit_MockObject":
    repository => "pear.phpunit.de",
    require    => Pear::Package["PEAR"],
  }

  pear::package { "PHP_CodeCoverage":
    repository => "pear.phpunit.de",
    require    => Pear::Package["PEAR"],
  }

  pear::package { "PHPUnit_Selenium":
    repository => "pear.phpunit.de",
    require    => Pear::Package["PEAR"],
  }

}