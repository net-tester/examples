When(/^httpでパッケージアップデートの実行$/) do
  cd('.') do
    @async_internet_update_server = AsyncExecutor.new(host: @internet_update_server, result_file: 'log/server.log')
    @async_internet_update_server.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nPackageUpdate\" | nc -l 80'"
    @dmz_server.exec "curl http://#{@internet_update_server.ip_address}/ > log/client.log"
  end
end

When(/^httpsでパッケージアップデートの実行$/) do
  cd('.') do
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec internet_upd echo '<title>PackageUpdate</title>' | sudo ip netns exec internet_upd openssl s_server -cert server.crt -key server.key -accept 443 > log/server.log &"
    sleep 2
    @dmz_server.exec "wget --no-check-certificate https://#{@internet_update_server.ip_address}/ -O log/client.log"
  end
end

Then(/^アップデートパッケージの取得に成功$/) do
  step %(the file "log/client.log" should contain "PackageUpdate")
end
