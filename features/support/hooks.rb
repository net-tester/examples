# frozen_string_literal: true

require 'active_support/core_ext/object/try'
require 'expectacle'

Before do
  NetTester.log_dir = File.join(Aruba.config.working_directory, 'log')
  NetTester.pid_dir = File.join(Aruba.config.working_directory, 'pids')
  NetTester.socket_dir = File.join(Aruba.config.working_directory, 'sockets')

  device = ENV['DEVICE'] || 'eth1'
  dpid = ENV['DPID'].try(&:hex) || 0x123
  NetTester.run(network_device: device, physical_switch_dpid: dpid)
  sleep 2
end

After do
  NetTester.kill
  system('sudo rm -rf /etc/netns/*')
  thrower = Expectacle::Thrower.new(base_dir: __dir__ + '/expectacle', logger: :syslog, verbose: false)
  l2sw_hosts = YAML.load_file("#{thrower.hosts_dir}/c3750g_hosts.yml")
  l2sw_commands = YAML.load_file("#{thrower.commands_dir}/c3750g_teardown.yml")
  fw_hosts = YAML.load_file("#{thrower.hosts_dir}/ssg_hosts.yml")
  fw_commands = YAML.load_file("#{thrower.commands_dir}/ssg_teardown.yml")
  thrower.run_command_for_all_hosts(l2sw_hosts, l2sw_commands)
  thrower.run_command_for_all_hosts(fw_hosts, fw_commands)
end
