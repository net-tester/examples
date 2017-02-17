When(/^VPN サーバ に Web ブラウザから http でログイン$/) do
  cd('.') do
    @async_vpn_server = AsyncExecutor.new(host: @vpn_server, result_file: 'log/server.log')
    @async_vpn_server.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nLoginOK\" | nc -l 80'"
    @user_pc.exec "curl http://#{@vpn_server.ip_address}/ > log/login.log"
  end
end

When(/^VPN サーバ に Web ブラウザから https でログイン$/) do
  cd('.') do
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec vpn_server echo '<title>LoginOK</title>' | sudo ip netns exec vpn_server openssl s_server -cert server.crt -key server.key -accept 443 > log/server.log &"
    sleep 2
    @user_pc.exec "wget --no-check-certificate https://#{@vpn_server.ip_address}/ -O log/login.log"
  end
end

When(/^DMZ のサーバ に Web ブラウザから http でログイン$/) do
  cd('.') do
    @async_dmz_server = AsyncExecutor.new(host: @dmz_server, result_file: 'log/server.log')
    @async_dmz_server.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nLoginOK\" | nc -l 80'"
    @user_pc.exec "curl http://#{@dmz_server.ip_address}/ > log/login.log"
  end
end

When(/^DMZ のサーバ に Web ブラウザから https でログイン$/) do
  cd('.') do
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec dmz_server echo '<title>LoginOK</title>' | sudo ip netns exec dmz_server openssl s_server -cert server.crt -key server.key -accept 443 > log/server.log &"
    sleep 2
    @user_pc.exec "wget --no-check-certificate https://#{@dmz_server.ip_address}/ -O log/login.log"
  end
end

Then(/^ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからログイン成功$/) do
  step %(the file "log/client.log" should contain "VPN")
end
