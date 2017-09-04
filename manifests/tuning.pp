# Tune MySQL instances.
# Class: win_mysql::tuning 
#
# This class requires the Puppet ini module 
# https://forge.puppet.com/puppetlabs/inifile
#
#
class win_mysql::tuning (
  #########################################
  # InnoDB settings
  #
  # For more information on default InnoDB settings visit:
  # https://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html
  #
  # Much of this content comes from these blog posts
  # * https://www.percona.com/blog/2014/01/28/10-mysql-performance-tuning-settings-after-installation/
  # * https://www.percona.com/blog/2016/10/12/mysql-5-7-performance-tuning-immediately-after-installation/
  # 
  # innodb_buffer_pool_size - Typical values are 5-6GB (8GB RAM), 20-25GB (32GB RAM), 100-120GB (128GB RAM)
  # The amount of RAM allocated to innodb storage engine to cache data and indexes of tables. 
  # This can normally be set to 70-80 % of the RAM, if this VM is dedicated for MySQL.
  #
  $innodb_buffer_pool_size_value = '1G', # (adjust value here, 50%-70% of total RAM)
  #
  # Starting with innodb_log_file_size = 512M (giving 1GB of redo logs) should give you plenty of room
  # for writes. If you know your application is write-intensive and you are using MySQL 5.6, you can start with 
  # innodb_log_file_size = 4G.
  #
  $innodb_log_file_size_value = '512M',
  # 
  #
  # This setting will tell InnoDB if it should store data and indexes in the shared tablespace 
  # (innodb_file_per_table = OFF) or in a separate .ibd file for each table (innodb_file_per_table= ON).
  $innodb_file_per_table_value = 'ON',
  #
  #
  # The default setting of 1 means that InnoDB is fully ACID compliant. It is the best value when your primary 
  # concern is data safety, for instance on a master. However it can have a significant overhead on systems with 
  # slow disks because of the extra fsyncs that are needed to flush each change to the redo logs. Setting it to 2 
  # is a bit less reliable because committed transactions will be flushed to the redo logs only once a second, but 
  # that can be acceptable on some situations for a master and that is definitely a good value for a replica. 0 is 
  # even faster but you are more likely to lose some data in case of a crash: it is only a good value for a replica.
  $innodb_flush_log_at_trx_commit_value = 1,
  #
  #
  $innodb_stats_on_metadata_value = 'OFF',
  #
  #
  $innodb_buffer_pool_instances_value = 8, #(or 1 if innodb_buffer_pool_size < 1GB) 
  #
  #
  ######################################### 
  # Basic settings
  #
  # If you are often facing the ‘Too many connections’ error, max_connections is too low.
  $max_connections_value = $win_mysql::params::max_connections,
  # 
  # 
  $query_cache_type_value = 0,
  #
  #
  $query_cache_size_value = 0, #(disabling mutex)
  #
  #
  $max_allowed_packet_value = $win_mysql::params::max_allowed_packet,
  #########################################

) inherits win_mysql::params {
  require win_mysql::server

  # Ini_Setting Defaults
  Ini_Setting {
      path    => $win_mysql::params::config_file,
      section => 'mysqld',
      }
 
  # Start of [mysqld] settings
  ini_setting { 'innodb_buffer_pool_size':
    section => 'mysqld',
    setting => 'innodb_buffer_pool_size',
    value   => $innodb_buffer_pool_size_value,
  }
  ini_setting { 'innodb_log_file_size':
    setting => 'innodb_log_file_size',
    value   => $innodb_log_file_size_value,
  }
  ini_setting { 'innodb_file_per_table':
   setting => 'innodb_file_per_table',
   value   => $innodb_file_per_table_value,
  }
  ini_setting { 'innodb_flush_log_at_trx_commit':
    setting => 'innodb_flush_log_at_trx_commit',
    value   => $innodb_flush_log_at_trx_commit_value,
  }
  ini_setting {'innodb_stats_on_metadata':
    setting => 'innodb_stats_on_metadata',
    value   => $innodb_stats_on_metadata_value,
  }
  ini_setting {'innodb_buffer_pool_instances':
    setting => 'innodb_buffer_pool_instances',
    value   => $innodb_buffer_pool_instances_value,
  }

  ini_setting { 'max_connections':
    setting => 'max_connections',
    value   => $max_connections_value,
  }
  ini_setting { 'query_cache_type':
    setting => 'query_cache_type',
    value   => $query_cache_type_value,
  }
  ini_setting {'query_cache_size':
    setting => 'query_cache_size',
    value   => $query_cache_size_value,
  }
  ini_setting {'max_allowed_packet':
    setting => 'max_allowed_packet',
    value   => $query_cache_size_value,
  }
}