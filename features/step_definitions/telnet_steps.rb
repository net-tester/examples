When(/^開発者 PC からテストサーバへTelnetでアクセス$/) do
  cd('.') do
    @async_test_server = AsyncExecutor.new(host: @test_server, result_file: 'log/telnet_server.log')
    @async_test_server.exec "nc -l 23"
    @internal_pc.exec "bash -c 'telnet #{@test_server.ip_address} > log/telnet_client.log; exit 0'"
  end
end

When(/^ヨーヨーダイン社のDMZ内部のVPNアドレスプールからヨーヨーダイン社内部のテスト環境サーバへTelnetでアクセス$/) do
  cd('.') do
    @async_test_server = AsyncExecutor.new(host: @test_server, result_file: 'log/telnet_server.log')
    @async_test_server.exec "nc -l 23"
    @vpn_address_pool.exec "bash -c 'telnet #{@test_server.ip_address} > log/telnet_client.log; exit 0'"
  end
end

Then(/^社内テストサーバにアクセス成功$/) do
  step %(the file "log/telnet_client.log" should contain "Escape character is")
end
