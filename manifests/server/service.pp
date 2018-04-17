# Manage the MySQL service
#
# Class: win_mysql::service
#
#
class win_mysql::server::service {
  service { 'MySQL':
    ensure    => $win_mysql::server::service::ensure,
    enable    => true,
    subscribe => Class['win_mysql::server::config'],
  }
}