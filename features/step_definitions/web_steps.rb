# coding: utf-8
When(/^ヨーヨーダイン社の VPN サーバに Web ブラウザから http でログイン$/) do
  cd('.') do
    system "echo '<title>LoginOK</title>' > index.html"
    @vpn_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/vpn_host.log')
    @vpn_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 80).start'")
    @src_host.exec "curl http://#{@vpn_host.ip_address}/ > log/login.log"
  end
end

When(/^ヨーヨーダイン社の VPN サーバに Web ブラウザから https でログイン$/) do
  cd('.') do
    system "echo '<title>LoginOK</title>' > index.html"
    @vpn_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/vpn_host.log')
    @vpn_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @src_host.exec "wget --no-check-certificate https://#{@vpn_host.ip_address}/ -O log/login.log"
  end
end

When(/^ヨーヨーダイン社の DMZ のサーバに Web ブラウザから http でログイン$/) do
  cd('.') do
    system "echo '<title>LoginOK</title>' > index.html"
    @http_service = AsyncExecutor.new(host: @dmz_host, result_file: 'log/dmz_host.log')
    @http_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 80).start'")
    @src_host.exec "curl http://#{@dmz_host.ip_address}/ > log/login.log"
  end
end

When(/^ヨーヨーダイン社の DMZ のサーバに Web ブラウザから https でログイン$/) do
  cd('.') do
    system "echo '<title>LoginOK</title>' > index.html"
    @dmz_service = AsyncExecutor.new(host: @dmz_host, result_file: 'log/dmz_host.log')
    @dmz_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @src_host.exec "wget --no-check-certificate https://#{@dmz_host.ip_address}/ -O log/login.log"
  end
end

When(/^http でインターネット上のサーバからパッケージアップデートを実行$/) do
  cd('.') do
    system "echo '<title>UpdateOK</title>' > index.html"
    @http_service = AsyncExecutor.new(host: @internet_host, result_file: 'log/internet_host.log')
    @http_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 80).start'")
    @src_host.exec "curl http://#{@internet_host.ip_address}/ > log/update.log"
  end
end

When(/^https でインターネット上のサーバからパッケージアップデートを実行$/) do
  cd('.') do
    system "echo '<title>UpdateOK</title>' > index.html"
    @https_service = AsyncExecutor.new(host: @internet_host, result_file: 'log/internet_host.log')
    @https_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @src_host.exec "wget --no-check-certificate https://#{@internet_host.ip_address}/ -O log/update.log"
  end
end

