# coding: utf-8
Given(/^DPID が (\S+) の NetTester 物理スイッチ$/) do |dpid|
  @dpid = dpid.hex
end

Given(/^NetTester をネットワークデバイス "([^"]*)" で起動$/) do |device|
  NetTester.run(@dpid)
  NetTester.connect_device_to_virtual_port(device: device, port_number: 1)
end
