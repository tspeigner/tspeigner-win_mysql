# Class: win_mysql::params
# 
#  The mysql configuration settings.

class win_mysql::params {
  $purge_conf_dir         = false
  $max_connections        = 151
  $query_cache_type       = 0
  $max_allowed_packet     = '16M'
  $client_package_version = 'latest'
  $server_package_version = 'latest'
  $mysql_bindir           = 'c:/tools/mysql/current/bin'
  $config_file            = 'c:/tools/mysql/current/my.ini'
}