Facter.add('win_mysqld_version') do
  setcode do
    win_mysqld_ver = Facter::Util::Resolution.exec('mysqld -V')
    win_mysqld_ver.match(%r{\d+\.\d+\.\d+})[0] if win_mysqld_ver
  end
end
