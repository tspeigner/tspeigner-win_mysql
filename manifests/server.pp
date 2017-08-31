# Classme
# win_mysql::server
#
class win_mysql::server (
    $server_package_version,
) {
  # Install MySQL server based on version
  package { 'mysql':
      #ensure   => $server_package_version,
      ensure   => installed,
      #ensure   => absent,
      provider => chocolatey,
  }
}