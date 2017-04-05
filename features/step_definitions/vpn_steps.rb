# coding: utf-8
When(/^VPN サーバに Firewall 経由で http でログイン$/) do
  cd('.') do
    system "echo '<title>AccessOK</title>' > login.html"
    @vpn_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/http_host.stdout', stderr_file: 'log/http_host.stderr')
    @vpn_service.exec("ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 80).start'")
    @src_host.exec 'curl -L http://203.0.113.5/login.html > log/access.log'
  end
end

When(/^VPN サーバに Firewall 経由で https でログイン$/) do
  cd('.') do
    system "echo '<title>AccessOK</title>' > login.html"
    @vpn_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/https_host.stdout', stderr_file: 'log/https_host.stderr')
    @vpn_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @src_host.exec 'curl -L --insecure https://203.0.113.5/login.html > log/access.log'
  end
end

