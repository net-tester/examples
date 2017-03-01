# coding: utf-8
When(/^VPN サーバ に Web ブラウザから http でログイン$/) do
  cd('.') do
    @vpn_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/vpn_host.log')
    @vpn_service.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nLoginOK\" | nc -l 80'"
    @user_pc.exec "curl http://#{@vpn_host.ip_address}/ > log/login.log"
  end
end

When(/^VPN サーバ に Web ブラウザから https でログイン$/) do
  cd('.') do
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec vpn_host echo '<title>LoginOK</title>' | sudo ip netns exec vpn_host openssl s_server -cert server.crt -key server.key -accept 443 > log/vpn_host.log &"
    sleep 2
    @user_pc.exec "wget --no-check-certificate https://#{@vpn_host.ip_address}/ -O log/login.log"
  end
end

When(/^DMZ のサーバ に Web ブラウザから http でログイン$/) do
  cd('.') do
    @http_service = AsyncExecutor.new(host: @dmz_host, result_file: 'log/dmz_host.log')
    @http_service.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nLoginOK\" | nc -l 80'"
    @user_pc.exec "curl http://#{@dmz_host.ip_address}/ > log/login.log"
  end
end

When(/^DMZ のサーバ に Web ブラウザから https でログイン$/) do
  cd('.') do
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec dmz_host echo '<title>LoginOK</title>' | sudo ip netns exec dmz_host openssl s_server -cert server.crt -key server.key -accept 443 > log/dmz_host.log &"
    sleep 2
    @user_pc.exec "wget --no-check-certificate https://#{@dmz_host.ip_address}/ -O log/login.log"
  end
end

When(/^http でパッケージアップデートを実行$/) do
  cd('.') do
    @http_service = AsyncExecutor.new(host: @internet_host, result_file: 'log/internet_host.log')
    @http_service.exec "bash -c 'echo -e \"HTTP/1.1 200 OK\\n\\nUpdateOK\" | nc -l 80'"
    @dmz_host.exec "curl http://#{@internet_host.ip_address}/ > log/update.log"
  end
end

When(/^https でパッケージアップデートを実行$/) do
  cd('.') do
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec internet_svr echo '<title>UpdateOK</title>' | sudo ip netns exec internet_svr openssl s_server -cert server.crt -key server.key -accept 443 > log/internet_host.log &"
    sleep 2
    @dmz_host.exec "wget --no-check-certificate https://#{@internet_host.ip_address}/ -O log/update.log"
  end
end

Then(/^ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからログイン成功$/) do
  step %(the file "log/client.log" should contain "VPN")
end
