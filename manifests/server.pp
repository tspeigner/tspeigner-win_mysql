# Classme
# win_mysql::server
#
class win_mysql::server {
  # Install required package Microsoft Visual C++ 2015 Redistributable 
  package { 'vcredist2015':
      ensure   => installed,
      provider => chocolatey,
      before   => Package['mysql']
  }
  package { 'mysql':
      #ensure   => $server_package_version,
      ensure   => installed,
      #ensure   => absent,
      provider => chocolatey,
  }
}