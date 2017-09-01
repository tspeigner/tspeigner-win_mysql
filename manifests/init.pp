# Class: win_mysql
# Authors
# -------
#
# Tommy Speigner <tommy |@| puppet |.|com>
#
# Copyright
# ---------
#
# Copyright 2017 Tommy Speigner, unless otherwise noted.
#
class win_mysql {
  include win_mysql::server
  include win_mysql::client

}
