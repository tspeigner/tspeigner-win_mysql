# Manage the MySQL service
#
# Class: win_mysql::service
#
#
class win_mysql::server::service {
  service { 'MySQL':
    ensure    => running,
    enable    => true,
    subscribe => Class['win_mysql::server::config'],
  }
}