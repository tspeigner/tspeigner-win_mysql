# Class: win_mysql::client 
#
#
class win_mysql::client (
    $client_package_version = installed, #Otherwise specify a version number
) {
    # Install package with Chocolatey
    package { 'mysql.workbench':
        ensure   => installed,
        provider => chocolatey,
    }
}