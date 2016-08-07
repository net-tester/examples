# coding: utf-8
Given(/^DPID が (\S+) の NetTester 物理スイッチ$/) do |dpid|
  @dpid = dpid.hex
end

Given(/^NetTester をネットワークデバイス "([^"]*)" で起動$/) do |device|
  cd('.') do
    NetTester.run(@dpid)
    NetTester.connect_switch(device: device, port_number: 1)
  end
end

Given(/^開発者の PC:$/) do |table|
  attrs = table.hashes.first
  cd('.') do
    @mac_address = Faker::Internet.mac_address
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
end

Given(/^開発者の PC を NetTester 物理スイッチのポート (\d+) 番にパッチで接続$/) do |port_number|
  cd('.') do
    NetTester.create_patch(source_port: @virtual_port,
                           source_mac_address: @mac_address,
                           destination_port: port_number.to_i)
  end
end
