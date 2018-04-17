# Class: win_mysql::client
#
#
class win_mysql::client::install {
    # Install package with Chocolatey
    package { 'mysql.workbench':
      ensure   => $win_mysql::client::install::workbench_version,
      provider => chocolatey,
    }
}
