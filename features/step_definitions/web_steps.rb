When(/^ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからhttpでログイン$/) do
  cd('.') do
    @async_vpn_server = AsyncExecutor.new(host: @vpn_server, result_file: 'log/server.log')
    @async_vpn_server.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nVPN\" | nc -l 80'"
    @internal_pc.exec "curl http://#{@vpn_server.ip_address}/ > log/client.log"
  end
end

When(/^ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからhttpsでログイン$/) do
  cd('.') do
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec vpn_server echo '<title>VPN</title>' | sudo ip netns exec vpn_server openssl s_server -cert server.crt -key server.key -accept 443 > log/server.log &"
    sleep 2
    @internal_pc.exec "wget --no-check-certificate https://#{@vpn_server.ip_address}/ -O log/client.log"
  end
end

Then(/^ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからログイン成功$/) do
  step %(the file "log/client.log" should contain "VPN")
end
