When(/^ヨーヨーダイン社からDMZ内のサーバにWebブラウザからhttpでログイン$/) do
  cd('.') do
    @async_dmz_server = AsyncExecutor.new(host: @dmz_server, result_file: 'log/server.log')
    @async_dmz_server.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nDMZServer\" | nc -l 80'"
    @internal_pc.exec "curl http://#{@dmz_server.ip_address}/ > log/client.log"
  end
end

When(/^ヨーヨーダイン社からDMZ内のサーバにWebブラウザからhttpsでログイン$/) do
  cd('.') do
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec dmz_server echo '<title>DMZServer</title>' | sudo ip netns exec dmz_server openssl s_server -cert server.crt -key server.key -accept 443 > log/server.log &"
    sleep 2
    @internal_pc.exec "wget --no-check-certificate https://#{@dmz_server.ip_address}/ -O log/client.log"
  end
end

Then(/^ヨーヨーダイン社からDMZ内のサーバにWebブラウザからログイン成功$/) do
  step %(the file "log/client.log" should contain "DMZServer")
end
