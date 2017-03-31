# coding: utf-8
# frozen_string_literal: true

require 'active_support/core_ext/object/try'
require 'expectacle'
require 'net/ssh'

# tester setは１箇所定義にしたいのでこうしている
require File.expand_path("../tester_sets.rb", __FILE__)

# ここでの起動からGivenでの起動に変更
# 課題としてログファイルの指定のしかたがわからないというのがある
#Before do
#  NetTester.log_dir = File.join(Aruba.config.working_directory, 'log')
#  NetTester.pid_dir = File.join(Aruba.config.working_directory, 'pids')
#  NetTester.socket_dir = File.join(Aruba.config.working_directory, 'sockets')
#
#  device = ENV['DEVICE'] || 'eth1'
#  dpid = ENV['DPID'].try(&:hex) || 0x123
#  NetTester.run(network_device: device, physical_switch_dpid: dpid)
#  sleep 2
#end

After do
  # 全testerのnet testrをkill
  tester_sets.each{|_, ip_address|
    NetTester.kill_on(tester_set: ip_address)
  }

  # これらは上記の分散実行に変更
  #NetTester.kill
  #system('sudo rm -rf /etc/netns/*')

  # これをどこでやるか、だれがやるか、はまだ考えてない。入れる人が拠点でそれぞれきまってるはずなので、これは分散かもしれない。
  thrower = Expectacle::Thrower.new(base_dir: __dir__ + '/expectacle', logger: :syslog, verbose: false)
  l2sw_hosts = YAML.load_file("#{thrower.hosts_dir}/c3750g_hosts.yml")
  l2sw_commands = YAML.load_file("#{thrower.commands_dir}/c3750g_teardown.yml")
  fw_hosts = YAML.load_file("#{thrower.hosts_dir}/ssg_hosts.yml")
  fw_commands = YAML.load_file("#{thrower.commands_dir}/ssg_teardown.yml")
  thrower.run_command_for_all_hosts(l2sw_hosts, l2sw_commands)
  thrower.run_command_for_all_hosts(fw_hosts, fw_commands)
end
