# frozen_string_literal: true

require 'active_support/core_ext/object/try'
require 'expectacle'
require 'httpclient'
require File.expand_path("../tester_sets.rb", __FILE__)

Before do
  @http_client = HTTPClient.new
  tester_sets.each do |_, tester_set|
    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    res = @http_client.delete(apiroot + "sites")
    if (res.code / 100).to_i != 2 then
      fail(StandardError.new("Cannot delete sites (site:#{_}, code:#{res.code})"))
    end
  end

  # TODO: need to support remote operation
  base_dir = "#{__dir__}/../support/expectacle"
  psw_before_flows_raw = `bundle exec run_command -r -b #{base_dir} -h psw_hosts.yml -c pica8_dumpflows.yml`.split("\r\n")
  @psw_before_flows = psw_before_flows_raw.grep(/^(NXST_FLOW| cookie)/).join("\n")
end

After do
  tester_sets.each do |_, tester_set|
    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    res = @http_client.delete(apiroot + "sites")
    if (res.code / 100).to_i != 2 then
      fail(StandardError.new("Cannot delete sites (site:#{_}, code:#{res.code})"))
    end
  end

  # TODO: need to support remote operation
  thrower = Expectacle::Thrower.new(base_dir: __dir__ + '/expectacle', logger: :syslog, verbose: false)
  l2sw_hosts = YAML.load_file("#{thrower.hosts_dir}/c3750g_hosts.yml")
  l2sw_commands = YAML.load_file("#{thrower.commands_dir}/c3750g_teardown.yml")
  fw_hosts = YAML.load_file("#{thrower.hosts_dir}/ssg_hosts.yml")
  fw_commands = YAML.load_file("#{thrower.commands_dir}/ssg_teardown.yml")
  thrower.run_command_for_all_hosts(l2sw_hosts, l2sw_commands)
  thrower.run_command_for_all_hosts(fw_hosts, fw_commands)

  base_dir = "#{__dir__}/../support/expectacle"
  psw_after_flows_raw = `bundle exec run_command -r -b #{base_dir} -h psw_hosts.yml -c pica8_dumpflows.yml`.split("\r\n")
  @psw_after_flows = psw_after_flows_raw.grep(/^(NXST_FLOW| cookie)/).join("\n")

  require "open3"
  stdout, stderr, status = Open3.capture3("#{__dir__}/../support/flowdiff.pl", :stdin_data => [@psw_before_flows, "", @psw_after_flows].join("\n"))
  Open3.capture3("cat > #{__dir__}/../../tmp/extraflows.yml", :stdin_data => stdout.split("\n").map{|i| "- \"ovs-ofctl del-flows br0 #{i}\"\n"}.join(""))
  `bundle exec run_command -r -b #{base_dir} -h psw_hosts.yml -c ../../../../tmp/extraflows.yml`
end
