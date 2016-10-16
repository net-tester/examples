#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pty'
require 'expect'
require 'yaml'

class RunCommands2Hosts
  def initialize
    # prompt regexp of device
    @prompt = {}
    # remote connection timeout
    @timeout = 60
    # cli mode flag
    @enable_mode = false
    # debug
    $expect_verbose = true
  end

  def run_command_for_all_hosts(host_list_file, command_list_file)
    @host_list = YAML.load_file(File.expand_path(__dir__ + "/user/#{host_list_file}"))

    @host_list.each do |host_param|
      run_command_for_host host_param, command_list_file
    end
  end

  def run_command_for_host(host_param, command_list_file)
    spawn_cmd = make_spawn_command host_param
    puts '### invalid spawn params' unless spawn_cmd
    @prompt = load_prompt_regexp host_param[:type]
    puts '### invalid parameter in param file(S)' unless @prompt

    puts "# spawn: #{spawn_cmd}"
    PTY.spawn(spawn_cmd) do |reader, writer, pid|
      @enable_mode = false
      run_command reader, writer, pid, host_param, command_list_file
    end
    puts "# finish spawn: #{host_param[:hostname]}"
  end

  private

  def load_prompt_regexp(host_type)
    prompt_file = File.expand_path(__dir__ + "/system/#{host_type}_prompt.yml")
    File.file?(prompt_file) ? YAML.load_file(prompt_file) : nil
  end

  def run_command(reader, writer, pid, host_param, command_list_file)
    writer.sync = true
    cmd_list = YAML.load_file(File.expand_path(__dir__ + "/user/#{command_list_file}"))
    begin
      until reader.eof?
        reader.expect(expect_regexp, @timeout) do |match|
          exec_each_prompt match[1], writer, host_param, cmd_list
        end
      end
    rescue Errno::EIO => _
      # NO-OP: when process exit (on linux)
    ensure
      # Process.wait pid
    end
  end

  def make_spawn_command(host_param)
    case host_param[:protocol]
    when /^telnet$/i
      ['telnet', host_param[:ipaddr]].join(' ')
    when /^ssh$/i
      ['ssh',
       '-o StrictHostKeyChecking=no',
       '-o KexAlgorithms=+diffie-hellman-group1-sha1',
       '-l', host_param[:username], host_param[:ipaddr]].join(' ')
    else
      puts "unknown protocol #{host_param[:protocol]}"
      nil
    end
  end

  def expect_regexp
    %r!
      ( #{@prompt[:password]} | #{@prompt[:username]}
      | #{@prompt[:command1]} | #{@prompt[:command2]}
      | #{@prompt[:sub1]} | #{@prompt[:sub2]}
      | #{@prompt[:yn]}
      )\s*$
    !x
  end

  def exec_each_prompt(prompt, writer, host_param, cmd_list)
    case prompt
    when /#{@prompt[:password]}/
      if @enable_mode
        writer.puts host_param[:enable]
      else
        writer.puts host_param[:password]
      end
    when /#{@prompt[:username]}/
      writer.puts host_param[:username]
    when /#{@prompt[:command1]}/
      writer.puts 'enable'
      @enable_mode = true
    when /#{@prompt[:command2]}/
      if cmd_list.length > 0
        writer.puts cmd_list.shift
      else
        puts "\n### break\n"
        writer.puts 'exit'
      end
    when /#{@prompt[:yn]}/
      # must mutch before sub_prompt
      writer.puts 'yes'
    when /#{@prompt[:sub1]}/, /#{@prompt[:sub2]}/
      writer.puts ''
    else
      puts "### unknown prompt #{prompt}"
    end
  end
end

# options
#if ARGV.size != 2 || !File.file?(ARGV[0]) || !File.file?(ARGV[1])
#  puts "#{$0} <hostlist.yml> <cmdlist.yml>"
#  exit
#end
#cmd2hosts = RunCommands2Hosts.new
#cmd2hosts.run_command_for_all_hosts(ARGV[0], ARGV[1])
