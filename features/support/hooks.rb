# coding: utf-8
# frozen_string_literal: true

Before do
  Dir.chdir(Aruba.config.working_directory) do
    FileUtils.mkdir_p('./log') unless File.exist?('./log')
    FileUtils.mkdir_p('./pids') unless File.exist?('./pids')
    FileUtils.mkdir_p('./sockets') unless File.exist?('./sockets')

    Phut.log_dir = './log'
    Phut.pid_dir = './pids'
    Phut.socket_dir = './sockets'
  end

  steps %(
    Given DPID が 0x123 の NetTester 物理スイッチ
    And NetTester をネットワークデバイス "eth1" で起動
  )
end

After do
  Dir.chdir(Aruba.config.working_directory) do
    Phut.log_dir = './log'
    Phut.pid_dir = './pids'
    Phut.socket_dir = './sockets'

    Phut::Netns.destroy_all
    NetTester.kill
  end
end
