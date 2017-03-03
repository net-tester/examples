# coding: utf-8
When(/^ヨーヨーダイン社内部のユーザ PC に ping$/) do
  cd('.') do
    @src_host.exec "bash -c 'ping #{@user_pc.ip_address} -c 1; exit 0'"
    @src_host.exec "ping #{@user_pc.ip_address} -c 4 > log/ping.log"
  end
end

When(/^ヨーヨーダイン社の DMZ の DNS サーバに ping$/) do
  cd('.') do
    @src_host.exec "bash -c 'ping #{@dns_host.ip_address} -c 1; exit 0'"
    @src_host.exec "ping #{@dns_host.ip_address} -c 4 > log/ping.log"
  end
end

When(/^ヨーヨーダイン社の DMZ のサーバに ping$/) do
  cd('.') do
    @src_host.exec "bash -c 'ping #{@dmz_host.ip_address} -c 1; exit 0'"
    @src_host.exec "ping #{@dmz_host.ip_address} -c 4 > log/ping.log"
  end
end

When(/^Router に ping$/) do
  cd('.') do
    @src_host.exec "bash -c 'ping 203.0.113.1 -c 1; exit 0'"
    @src_host.exec 'ping 203.0.113.1 -c 4 > log/ping.log'
  end
end

When(/^Firewall に ping$/) do
  cd('.') do
    @src_host.exec "bash -c 'ping 203.0.113.2 -c 1; exit 0'"
    @src_host.exec 'ping 203.0.113.2 -c 4 > log/ping.log'
  end
end

When(/^ヨーヨーダイン社の VPN サーバに ping$/) do
  cd('.') do
    @src_host.exec "bash -c 'ping 203.0.113.5 -c 1; exit 0'"
    @src_host.exec 'ping 203.0.113.5 -c 4 > log/ping.log'
  end
end

When(/^インターネット上のサーバに ping$/) do
  cd('.') do
    @src_host.exec "bash -c 'ping #{@internet_host.ip_address} -c 1; exit 0'"
    @src_host.exec "ping #{@internet_host.ip_address} -c 4 > log/ping.log"
  end
end
