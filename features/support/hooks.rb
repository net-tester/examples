# frozen_string_literal: true

Before do
  Dir.chdir(Aruba.config.working_directory) do
    FileUtils.mkdir_p('./log') unless File.exist?('./log')
    FileUtils.mkdir_p('./pids') unless File.exist?('./pids')
    FileUtils.mkdir_p('./sockets') unless File.exist?('./sockets')

    Phut.log_dir = './log'
    Phut.pid_dir = './pids'
    Phut.socket_dir = './sockets'

    NetTester.run(network_device: 'eth1', physical_switch_dpid: 0x123)
  end
end

After do
  Dir.chdir(Aruba.config.working_directory) do
    Phut.log_dir = './log'
    Phut.pid_dir = './pids'
    Phut.socket_dir = './sockets'

    NetTester.kill
  end
end
