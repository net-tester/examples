# coding: utf-8
When(/^ヨーヨーダイン社内部のテスト環境サーバに telnet でログイン$/) do
  cd('.') do
    @telnet_service = AsyncExecutor.new(host: @test_host, result_file: 'log/telnet_host.log')
    @telnet_service.exec "bash -c 'echo LoginOK | sudo nc -l 23'"
    @src_host.exec "ruby -e \"require 'net/telnet'; Net::Telnet.new('Host' => '#{@test_host.ip_address}', 'Port' => '23').cmd('') {|res| print res}\" > log/login.log"
  end
end
