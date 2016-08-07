# frozen_string_literal: true
Before do
  Dir.chdir 'tmp/aruba'

  FileUtils.mkdir_p('./log') unless File.exist?('./log')
  FileUtils.mkdir_p('./tmp/pids') unless File.exist?('./tmp/pids')
  FileUtils.mkdir_p('./tmp/sockets') unless File.exist?('./tmp/sockets')

  Phut.log_dir = './log'
  Phut.pid_dir = './tmp/pids'
  Phut.socket_dir = './tmp/sockets'
end

After do
  Phut.log_dir = './log'
  Phut.pid_dir = './tmp/pids'
  Phut.socket_dir = './tmp/sockets'

  Phut::Netns.destroy_all
  NetTester::Command.kill

  Dir.chdir '../..'
end
