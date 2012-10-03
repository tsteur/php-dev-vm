class db($db_root_password, $db_name, $db_username, $db_password) {

  class { 'mysql': 
    require => Exec['make_update'],
  }

  class { 'mysql::server':
    config_hash => { 'root_password' => $db_root_password },
    require     => Exec['make_update'],
  }

  mysql::db { $db_name:
    user     => $db_username,
    password => $db_password,
    host     => 'localhost',
    grant    => ['all'],
  }

}