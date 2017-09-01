Facter.add('mysql_client_version') do
    setcode do
      mysql_client_ver = Facter::Util::Resolution.exec('mysql --version')
      mysql_client_ver.match(%r{\d+\.\d+\.\d+})[0] if mysql_client_ver
    end
  end