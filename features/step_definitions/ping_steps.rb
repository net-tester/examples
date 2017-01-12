When(/^ヨーヨーダイン社内部のクライアントにDMZからpingで疎通確認$/) do
  cd('.') do
    @dmz_server.exec "ping #{@internal_pc.ip_address} -c 4 > log/ping.log"
  end
end

When(/^DNSサーバにヨーヨーダイン社PCからpingで疎通確認$/) do
  cd('.') do
    @internal_pc.exec "ping #{@dns_server.ip_address} -c 4 > log/ping.log"
  end
end

When(/^DMZにヨーヨーダイン社のPCからpingで疎通確認$/) do
  cd('.') do
    @internal_pc.exec "ping #{@dmz_server.ip_address} -c 4 > log/ping.log"
  end
end

When(/^ヨーヨーダイン社のRouterにInternet上のPCからpingで疎通確認$/) do
  cd('.') do
    @internet_pc.exec 'ping 203.0.113.1 -c 4 > log/ping.log'
  end
end

When(/^FirewallにInternet上のPCからpingで疎通確認$/) do
  cd('.') do
    @internet_pc.exec 'ping 203.0.113.2 -c 4 > log/ping.log'
  end
end

When(/^Internet上のサーバにヨーヨーダイン社のPCからpingで疎通確認$/) do
  cd('.') do
    @internal_pc.exec "ping #{@internet_server.ip_address} -c 4 > log/ping.log"
  end
end

Then(/^pingで疎通成功$/) do
  step %(the file "log/ping.log" should contain "4 received, 0% packet loss")
end
