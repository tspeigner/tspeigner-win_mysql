# Class: win_mysql::client::install 
#
#
class win_mysql::client::install (
    $client_package_version = $win_mysql::params::client_package_version,
) {
    # Install package with Chocolatey
    package { 'mysql.workbench':
        ensure   => $client_package_version,
        provider => chocolatey,
    }
}