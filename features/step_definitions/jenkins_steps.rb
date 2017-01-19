When(/^開発者 PC から Web ブラウザでテストサーバの Web コンソールにアクセス$/) do
  cd('.') do
    @async_test_server = AsyncExecutor.new(host: @test_server, result_file: 'log/server.log')
    @async_test_server.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nJenkins\" | nc -l 13000'"
    @internal_pc.exec "curl http://#{@test_server.ip_address}:13000/ > log/client.log"
  end
end

When(/^ヨーヨーダイン社のDMZ内部のVPNアドレスプールから Web ブラウザでヨーヨーダイン社内部のテスト環境サーバの Web コンソールにアクセス$/) do
  cd('.') do
    @async_test_server = AsyncExecutor.new(host: @test_server, result_file: 'log/server.log')
    @async_test_server.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nJenkins\" | nc -l 13000'"
    @vpn_address_pool.exec "curl http://#{@test_server.ip_address}:13000/ > log/client.log"
  end
end

Then(/^社内テストサーバの Web コンソールにアクセス成功$/) do
  step %(the file "log/client.log" should contain "Jenkins")
end
