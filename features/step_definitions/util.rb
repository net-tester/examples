require 'expectacle'
require 'net/http'

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

def check_connection(log)
  time_diff = 0
  logfile = log.split("\n")
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

def upload_testlet(tester_set, file_name)
  boundary = "---------------------------#{rand(10000000000000000000)}"
  contents = File::open(file_name).read
  data =  %[--#{boundary}] + "\r\n"
  data << %[Content-Disposition: form-data; name="testlet[file]"; filename="#{file_name}"] + "\r\n"
  data << %[Content-Type: multipart/form-data] + "\r\n\r\n"

  data << contents
  data << %[\r\n--#{boundary}--\r\n]

  header = {
    'Content-Length' => data.length.to_s,
    'Content-Type' => "multipart/form-data; boundary=#{boundary}"
  }

  Net::HTTP.start(tester_set[:ip_address], 3000) do |http|
    http.post('/testlets', data, header)
  end
end

