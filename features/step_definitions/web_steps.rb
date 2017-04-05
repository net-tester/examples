# coding: utf-8
When(/^VPN サーバに Web ブラウザから http でログイン$/) do
  cd('.') do
    system "echo '<title>AccessOK</title>' > index.html"
    @vpn_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/vpn_host.log')
    @vpn_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 80).start'")
    @src_host.exec "curl http://#{@vpn_host.ip_address}/ > log/access.log"
  end
end

When(/^VPN サーバに Web ブラウザから https でログイン$/) do
  cd('.') do
    system "echo '<title>AccessOK</title>' > index.html"
    @vpn_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/vpn_host.log')
    @vpn_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @src_host.exec "wget --no-check-certificate https://#{@vpn_host.ip_address}/ -O log/access.log"
  end
end

When(/^DMZ のサーバに Web ブラウザから http でログイン$/) do
  cd('.') do
    system "echo '<title>AccessOK</title>' > index.html"
    @http_service = AsyncExecutor.new(host: @dmz_host, result_file: 'log/dmz_host.log')
    @http_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 80).start'")
    @src_host.exec "curl http://#{@dmz_host.ip_address}/ > log/access.log"
  end
end

When(/^DMZ のサーバに Web ブラウザから https でログイン$/) do
  cd('.') do
    system "echo '<title>AccessOK</title>' > index.html"
    @dmz_service = AsyncExecutor.new(host: @dmz_host, result_file: 'log/dmz_host.log')
    @dmz_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @src_host.exec "wget --no-check-certificate https://#{@dmz_host.ip_address}/ -O log/access.log"
  end
end

When(/^http でパッケージアップデートを実行$/) do
  cd('.') do
    system "echo '<title>AccessOK</title>' > index.html"
    @http_service = AsyncExecutor.new(host: @internet_host, result_file: 'log/internet_host.log')
    @http_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 80).start'")
    @src_host.exec "curl http://#{@internet_host.ip_address}/ > log/access.log"
  end
end

When(/^https でパッケージアップデートを実行$/) do
  cd('.') do
    system "echo '<title>AccessOK</title>' > index.html"
    @https_service = AsyncExecutor.new(host: @internet_host, result_file: 'log/internet_host.log')
    @https_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @src_host.exec "wget --no-check-certificate https://#{@internet_host.ip_address}/ -O log/access.log"
  end
end

