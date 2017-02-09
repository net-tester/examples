# coding: utf-8
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

When(/^ヨーヨーダイン社の Router にインターネット上の PC から ping$/) do
  cd('.') do
    @internet_pc.exec 'ping 203.0.113.1 -c 4 > log/ping.log'
  end
end

When(/^Firewall にインターネット上の PC から ping$/) do
  cd('.') do
    @internet_pc.exec 'ping 203.0.113.2 -c 4 > log/ping.log'
  end
end

When(/^VPN サーバにインターネット上の PC から ping$/) do
  cd('.') do
    @internet_pc.exec 'ping 203.0.113.5 -c 4 > log/ping.log'
  end
end

When(/^インターネット上のサーバにヨーヨーダイン社の PC から ping$/) do
  cd('.') do
    @internal_pc.exec "ping #{@internet_server.ip_address} -c 4 > log/ping.log"
  end
end

When(/^インターネット上のサーバに DMZ のサーバから ping$/) do
  cd('.') do
    @dmz_server.exec "ping #{@internet_server.ip_address} -c 4 > log/ping.log"
  end
end

When(/^VPN サーバにタジマックス工業の PC から ping で疎通確認$/) do
  cd('.') do
    @tajimax_pc.exec 'ping 203.0.113.5 -c 4 > log/ping.log'
  end
end

Then(/^ping 成功$/) do
  step %(the file "log/ping.log" should contain "4 received, 0% packet loss")
end
