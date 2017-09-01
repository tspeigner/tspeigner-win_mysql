Facter.add('mysqld_version') do
  setcode do
    mysqld_ver = Facter::Util::Resolution.exec('mysqld -V')
    mysqld_ver.match(%r{\d+\.\d+\.\d+})[0] if mysqld_ver
  end
end
