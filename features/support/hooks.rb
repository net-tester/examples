# frozen_string_literal: true

Before do
  Dir.chdir(Aruba.config.working_directory) do
    NetTester.log_dir = './log'
    NetTester.pid_dir = './pids'
    NetTester.socket_dir = './sockets'

    NetTester.run(network_device: 'eth1', physical_switch_dpid: 0x123)
  end
end

After do
  Dir.chdir(Aruba.config.working_directory) do
    NetTester.kill
  end
end
