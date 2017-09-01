Facter.add('win_mysql_version') do
  setcode do
    win_mysql_ver = Facter::Util::Resolution.exec('mysql --version')
    win_mysql_ver.match(%r{\d+\.\d+\.\d+})[0] if win_mysql_ver
  end
end
