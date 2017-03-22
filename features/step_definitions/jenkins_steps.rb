# coding: utf-8
When(/^Web ブラウザで社内のテスト環境サーバの Web コンソールにアクセス$/) do
  cd('.') do
    @jenkins_service = AsyncExecutor.new(host: @test_host, result_file: 'log/test_host.log')
    @jenkins_service.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nAccessOK\" | nc -l 13000'"
    @src_host.exec "curl http://#{@test_host.ip_address}:13000/ > log/access.log"
  end
end
