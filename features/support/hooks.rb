# frozen_string_literal: true

Before do
  NetTester.log_dir = File.join(Aruba.config.working_directory, 'log')
  NetTester.pid_dir = File.join(Aruba.config.working_directory, 'pids')
  NetTester.socket_dir = File.join(Aruba.config.working_directory, 'sockets')

  NetTester.run(network_device: 'eth1', physical_switch_dpid: 0x123)
end

After do
  NetTester.kill
end
