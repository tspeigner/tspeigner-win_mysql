# Manage the MySQL service
#
# Class: win_mysql::service
#
#
class win_mysql::service {
    service { 'mysqld':
        ensure => running,
        enable => true,
    }
}