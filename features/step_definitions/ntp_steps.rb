# coding: utf-8
Given(/^開発者の PC:$/) do |table|
  attrs = table.hashes.first
  @mac_address = Faker::Internet.mac_address('00')
  @virtual_port = attrs['virtual port'].to_i
  @ntp_client =
    NetTester.add_netns(port_number: @virtual_port,
                        ip_address: attrs['IP address'],
                        mac_address: @mac_address,
                        name: 'ntp_client',
                        netmask: attrs['netmask'],
                        route: { net: '0.0.0.0',
                                 gateway: attrs['default gateway'] })
end

Given(/^開発者の PC を NetTester 物理スイッチのポート (\d+) 番にパッチで接続$/) do |port_number|
  NetTester.create_patch(source_port: @virtual_port,
                         source_mac_address: @mac_address,
                         destination_port: port_number.to_i)
end

When(/^NTP サーバ "([^"]*)" で PC の時刻を同期$/) do |ntp_server|
  @ntp_client.exec "ntpdate -q #{ntp_server} > ntpdate.log"
end

Then(/^時刻の同期に成功$/) do
  step %(the file "ntpdate.log" should contain "adjust time server")
end
