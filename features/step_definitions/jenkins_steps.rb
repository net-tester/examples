# coding: utf-8
When(/^Web ブラウザで社内のテスト環境サーバの Web コンソールにアクセス$/) do
  cd('.') do
    @jenkins_service = @test_host
    @jenkins_service.exec("bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nAccessOK\" | nc -l 13000'")
    @process_id = @src_host.exec("curl http://#{@test_host.ip_address}:13000/", delayed: true)
  end
end
