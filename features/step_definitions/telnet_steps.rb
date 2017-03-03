# coding: utf-8
When(/^開発者 PC からテストサーバへTelnetでアクセス$/) do
  cd('.') do
    @telnet_service = AsyncExecutor.new(host: @test_host, result_file: 'log/telnet_host.log')
    @telnet_service.exec "bash -c 'echo TelnetOK | sudo nc -l 23'"
    @internal_pc.exec "bash -c 'telnet #{@test_host.ip_address} > log/telnet_client.log; exit 0'"
  end
end

When(/^ヨーヨーダイン社のDMZ内部のVPNアドレスプールからヨーヨーダイン社内部のテスト環境サーバへTelnetでアクセス$/) do
  cd('.') do
    @telnet_service = AsyncExecutor.new(host: @test_host, result_file: 'log/telnet_host.log')
    @telnet_service.exec "bash -c 'echo TelnetOK | sudo nc -l 23'"
    @vpn_address_pool.exec "bash -c 'telnet #{@test_host.ip_address} > log/telnet_client.log; exit 0'"
  end
end

Then(/^社内テストサーバにアクセス成功$/) do
  step %(the file "log/telnet_client.log" should contain "TelnetOK")
end
