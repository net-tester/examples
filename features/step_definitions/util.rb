require 'expectacle'

def make_port_down(port)
    thrower = Expectacle::Thrower.new(base_dir: __dir__ + '/../support/expectacle', logger: :syslog, verbose: false)
    pica8_hosts = YAML.load_file("#{thrower.hosts_dir}/pica8_hosts.yml")
    pica8_commands = YAML.load_file("#{thrower.commands_dir}/pica8_port_#{port}_down.yml")
    thrower.run_command_for_all_hosts(pica8_hosts, pica8_commands)
end

def make_port_up(port)
    thrower = Expectacle::Thrower.new(base_dir: __dir__ + '/../support/expectacle', logger: :syslog, verbose: false)
    pica8_hosts = YAML.load_file("#{thrower.hosts_dir}/pica8_hosts.yml")
    pica8_commands = YAML.load_file("#{thrower.commands_dir}/pica8_port_#{port}_up.yml")
    thrower.run_command_for_all_hosts(pica8_hosts, pica8_commands)
end

def check_connection(log_filename)
  time_diff = 0
  logfile = File.open(log_filename).readlines
  time_list = logfile.map do |data|
    data.start_with?("[") ? data.split(" ")[0].tr("[|]","").to_f : nil
  end.compact
  line_count = time_list.size
  time_list_for_diff = time_list.dup
  time_list.shift
  time_list << 0
  time_diff = time_list.zip(time_list_for_diff).map { |time1, time2| time1 - time2 }.max
  return line_count, time_diff
end

