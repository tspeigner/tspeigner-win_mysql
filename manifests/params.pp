# Class: win_mysql::params
# 
#  The mysql configuration settings.

class win_mysql::params {

  $bind_address           = '127.0.0.1'
  $default_engine         = 'UNSET'
  $manage_service         = true
  $package_ensure         = 'present'
  $purge_conf_dir         = false
  $max_connections        = 151
  $port                   = 3306
  $max_allowed_packet     = '16M'
  $restart                = true
  $ssl                    = false
  $key_buffer             = '16M'
  $thread_stack           = '256K'
  $thread_cache_size      = 8
  $myisam_recover         = 'BACKUP'
  $query_cache_limit      = '1M'
  $query_cache_size       = '16M'
  $expire_logs_days       = 10
  $max_binlog_size        = '100M'
  $service_name           = 'mysqld'
  $client_package_name    = 'workbench'
  $client_package_version = undef
  $client_package_ensure  = true
  $server_package_name    = 'mysql'
  $server_package_version = undef
  $server_package_ensure  = true
  $choco_mysql_basedir    = 'c:\tools\mysql\current'
  $choco_mysql_bindir     = 'c:\tools\mysql\current\bin'
  $choco_config_file      = 'c:\tools\mysql\current\my.ini'
  $mysql_datadir          = 'C:\ProgramData\MySQL\data'

  if $::chocolateyversion != '0' {
      $provider_type = 'chocolatey'
  } else {
      $provider_type = 'windows'
  }

}