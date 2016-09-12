# frozen_string_literal: true

require 'active_support/core_ext/object/try'

Before do
  NetTester.log_dir = File.join(Aruba.config.working_directory, 'log')
  NetTester.pid_dir = File.join(Aruba.config.working_directory, 'pids')
  NetTester.socket_dir = File.join(Aruba.config.working_directory, 'sockets')

  device = ENV['DEVICE'] || 'eth1'
  dpid = ENV['DPID'].try(&:hex) || 0x123
  NetTester.run(network_device: device, physical_switch_dpid: dpid)
end

After do
  NetTester.kill
end
