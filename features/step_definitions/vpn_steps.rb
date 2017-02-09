# coding: utf-8
Given(/^ヨーヨーダイン社のDMZ内部のVPNサーバとVPNプロセス$/) do
  step %(ヨーヨーダイン社のDMZ内部のVPNサーバ)
  cd('.') do
    system "echo '<title>YoyodyneVPN</title>' > login.html"
    @http_server = AsyncExecutor.new(host: @vpn_server, result_file: 'log/http_server.stdout', stderr_file: 'log/http_server.stderr')
    @http_server.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 80).start'")
    @https_server = AsyncExecutor.new(host: @vpn_server, result_file: 'log/https_server.stdout', stderr_file: 'log/https_server.stderr')
    @http_server.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    sleep 3;
  end
end

When(/^SSLVPNサーバにタジマックス工業のPCからログイン$/) do
  cd('.') do
    @tajimax_pc.exec 'curl -L http://203.0.113.5/login.html > log/vpn_access.http'
    @tajimax_pc.exec 'curl -L --insecure https://203.0.113.5/login.html > log/vpn_access.https'
  end
end

Then(/^SSLVPNサーバにログイン成功$/) do
  step %(the file "log/vpn_access.http" should contain "<title>YoyodyneVPN</title>")
  step %(the file "log/vpn_access.https" should contain "<title>YoyodyneVPN</title>")
end
