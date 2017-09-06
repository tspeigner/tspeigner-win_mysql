# Classme
# win_mysql::server
#
class win_mysql::server {
    include win_mysql::server::install
    include win_mysql::server::config
    include win_mysql::server::service
}
