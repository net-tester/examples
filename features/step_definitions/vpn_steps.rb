# coding: utf-8
When(/^VPN サーバに Firewall 経由で http でログイン$/) do
  cd('.') do
    @vpn_host.exec("echo '<title>AccessOK</title>' | tee /tmp/login.html", sync: true)
    @vpn_service = @vpn_host
    @vpn_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"/tmp\", :Port => 80).start'")
    @process_id = @src_host.exec('curl -L http://203.0.113.5/login.html', delayed: true)
  end
end

When(/^VPN サーバに Firewall 経由で https でログイン$/) do
  cd('.') do
    @vpn_host.exec("echo '<title>AccessOK</title>' | tee /tmp/login.html", sync: true)
    @vpn_service = @vpn_host
    @vpn_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"/tmp\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @process_id = @src_host.exec('curl -L --insecure https://203.0.113.5/login.html', delayed: true)
  end
end

