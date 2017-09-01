def win_mysql_id_get
  Facter.value(:macaddress).split(':')[2..-1].reduce(0) { |total, value| (total << 6) + value.hex }
end

Facter.add('win_mysql_server_id') do
  setcode do
    begin
      win_mysql_id_get
    rescue
      nil
    end
  end
end
