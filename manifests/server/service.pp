# Manage the MySQL service
#
# Class: win_mysql::service
#
#
class win_mysql::server::service {
    include win_mysql::server::config

    service { 'MySQL':
        ensure    => running,
        enable    => true,
        subscribe => Class['win_mysql::config']
    }
}