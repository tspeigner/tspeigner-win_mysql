# Classme
# win_mysql::server
#
class win_mysql::server (
    $major_version          = '5.7',
    $bind_address           = '127.0.0.1' ,
    $server_package_version = '5.7.18',
) {
    # Install MySQL with Chocolatey, if it is installed
    case $chocolateyversion {
        '0': {
            notify { 'chocolatey':
              message => 'Chocolatey is not installed'
            }
        }
        # Requires staging module: https://forge.puppet.com/puppet/staging
        default: {
            remote_file { "c:/tools/mysql-${server_package_version}-winx64.zip":
                ensure => present,
                source => "https://dev.mysql.com/get/Downloads/MySQL-${major_version}/mysql-${server_package_version}-winx64.zip",
            }
            unzip { "mysql-${server_package_version}-winx64.zip":
                source  => "c:/tools/mysql-${server_package_version}-winx64.zip",
                creates => 'c:/tools/mysql',
                require => Remote_file["c:/tools/mysql-${server_package_version}-winx64.zip"],
            }
        }
    }
#  # Install packages based on architecture x86 or win32
#  case $::architecture {
#    'x64': {
#        package { 'mysql':
#            ensure   => $server_package_version,
#            #source => "https://dev.mysql.com/get/Downloads/MySQL-${major_version}/mysql-${server_package_version}-winx86.zip"
#            provider => chocolatey,
#        }
#    }
#    default: {
#        package { 'mysql':
#            ensure => installed,
#            #source => "https://dev.mysql.com/get/Downloads/MySQL-${major_version}/mysql-${server_package_version}-win32.zip"
#
#        }
#    }

#  }
}