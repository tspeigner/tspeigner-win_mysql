# Class: win_mysql::params
# 
#  The mysql configuration settings.

class win_mysql::params {

  $bind_address           = '127.0.0.1'
  $default_engine         = 'UNSET'
  $purge_conf_dir         = false
  $max_connections        = 151
  $port                   = 3306
  $max_allowed_packet     = '16M'
  $ssl                    = false
  $client_package_ensure  = true
  $server_package_ensure  = true
  $server_package_version = 'latest'
  $choco_mysql_basedir    = 'c:\tools\mysql\current'
  $choco_mysql_bindir     = 'c:\tools\mysql\current\bin'
  $choco_config_file      = 'c:\tools\mysql\current\my.ini'
  $mysql_datadir          = 'C:\ProgramData\MySQL\data'

}