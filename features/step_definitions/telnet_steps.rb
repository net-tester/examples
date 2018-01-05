# coding: utf-8
When(/^社内のテスト環境サーバに telnet でログイン$/) do
  cd('.') do
    @telnet_service = @test_host
    @telnet_service.exec("bash -c 'echo AccessOK | sudo nc -l 23'")
    @process_id = @src_host.exec("ruby -e \"require 'net/telnet'; Net::Telnet.new('Host' => '#{@test_host.ip_address}', 'Port' => '23').cmd('') {|res| print res}\"", delayed: true)
  end
end
