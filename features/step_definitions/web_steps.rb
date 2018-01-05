# coding: utf-8
When(/^VPN サーバに Web ブラウザから http でログイン$/) do
  cd('.') do
    @vpn_host.exec("rm -f /tmp/index.html; echo '<title>AccessOK</title>' | tee /tmp/index.html", sync: true)
    @vpn_service = @vpn_host
    @vpn_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"/tmp\", :Port => 80).start'")
    @process_id = @src_host.exec("curl http://#{@vpn_host.ip_address}/", delayed: true)
  end
end

When(/^VPN サーバに Web ブラウザから https でログイン$/) do
  cd('.') do
    @vpn_host.exec("rm -f /tmp/index.html; echo '<title>AccessOK</title>' | tee /tmp/index.html", sync: true)
    @vpn_service = @vpn_host
    @vpn_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"/tmp\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @process_id = @src_host.exec("wget --no-check-certificate https://#{@vpn_host.ip_address}/ -O -", delayed: true)
  end
end

When(/^DMZ のサーバに Web ブラウザから http でログイン$/) do
  cd('.') do
    @dmz_host.exec("rm -f /tmp/index.html; echo '<title>AccessOK</title>' | tee /tmp/index.html", sync: true)
    @http_service = @dmz_host
    @http_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"/tmp\", :Port => 80).start'")
    @process_id = @src_host.exec("curl http://#{@dmz_host.ip_address}/", delayed: true)
  end
end

When(/^DMZ のサーバに Web ブラウザから https でログイン$/) do
  cd('.') do
    @dmz_host.exec("rm -f /tmp/index.html; echo '<title>AccessOK</title>' | tee /tmp/index.html", sync: true)
    @https_service = @dmz_host
    @https_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"/tmp\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @process_id = @src_host.exec("wget --no-check-certificate https://#{@dmz_host.ip_address}/ -O -", delayed: true)
  end
end

When(/^http でパッケージアップデートを実行$/) do
  cd('.') do
    @internet_host.exec("rm -f /tmp/index.html; echo '<title>AccessOK</title>' | tee /tmp/index.html", sync: true)
    @http_service = @internet_host
    @http_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"/tmp\", :Port => 80).start'")
    @process_id = @src_host.exec("curl http://#{@internet_host.ip_address}/", delayed: true)
  end
end

When(/^https でパッケージアップデートを実行$/) do
  cd('.') do
    @internet_host.exec("rm -f /tmp/index.html; echo '<title>AccessOK</title>' | tee /tmp/index.html", sync: true)
    @https_service = @internet_host
    @https_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"/tmp\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @process_id = @src_host.exec("wget --no-check-certificate https://#{@internet_host.ip_address}/ -O -", delayed: true)
  end
end

