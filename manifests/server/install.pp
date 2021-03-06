# Classme
# win_mysql::server::install
#
class win_mysql::server::install (
  #default is installed, otherwise replace with version number. Change values in params.pp
  $server_package_version = win_mysql::server::install::server_version,
) {
  # Install required package Microsoft Visual C++ 2013 Redistributable 
  # https://www.microsoft.com/en-us/download/details.aspx?id=40784 
  package { 'vcredist2013':
    ensure   => installed,
    provider => chocolatey,
    before   => Package['mysql'],
    notify   => Reboot['after_vcredist2013'],
  }
  # Reboot the server after installing Microsoft Visual C++ 2013 Redistributable
  # Reboot module required - https://forge.puppet.com/puppetlabs/reboot
  reboot { 'after_vcredist2013':
    apply => immediately,
  }
  package { 'mysql':
    ensure   => $server_package_version,
    provider => chocolatey,
    before   => Service['MySQL']
  }
}
