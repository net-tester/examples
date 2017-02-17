Given(/^DNS クライアントとなる開発者 PC$/) do
  step %(ヨーヨーダイン社内部のクライアント)
end

When(/^ヨーヨーダイン社のDMZ内のDNSサーバでインターネット上のサーバの名前解決$/) do
  cd('.') do
    @dns_server.exec "mkdir -p /etc/netns/#{@dns_server.name}"
    @dns_server.exec "echo '172.217.25.196 www.google.com' | sudo tee /etc/netns/#{@dns_server.name}/hosts"
    @dns_server.exec "echo 'port=53' | sudo tee dnsmasq.conf"
    @dns_server.exec "echo 'expand-hosts' | sudo tee -a dnsmasq.conf"
    @async_dns_server = AsyncExecutor.new(host: @dns_server, result_file: 'log/dns.log')
    @async_dns_server.exec "dnsmasq -C dnsmasq.conf"
    @internal_pc.exec "dig @#{@dns_server.ip_address} www.google.com A > log/dns.log"
  end
end

When(/^dig コマンドで "www.google.com" の IP アドレスを調べる$/) do
  cd('.') do
    @dns_server.exec "mkdir -p /etc/netns/#{@dns_server.name}"
    @dns_server.exec "echo '172.217.25.196 www.google.com' | sudo tee /etc/netns/#{@dns_server.name}/hosts"
    @dns_server.exec "echo 'port=53' | sudo tee dnsmasq.conf"
    @dns_server.exec "echo 'expand-hosts' | sudo tee -a dnsmasq.conf"
    @async_dns_server = AsyncExecutor.new(host: @dns_server, result_file: 'log/dns.log')
    @async_dns_server.exec "dnsmasq -C dnsmasq.conf"
    @dmz_server.exec "dig @#{@dns_server.ip_address} www.google.com A > log/dns.log"
  end
end

When(/^インターネット上のDNSサーバでインターネット上のサーバの名前解決$/) do
  cd('.') do
    @internet_dns_server.exec "mkdir -p /etc/netns/#{@internet_dns_server.name}"
    @internet_dns_server.exec "echo '172.217.25.196 www.google.com' | sudo tee /etc/netns/#{@internet_dns_server.name}/hosts"
    @internet_dns_server.exec "echo 'port=53' | sudo tee dnsmasq.conf"
    @internet_dns_server.exec "echo 'expand-hosts' | sudo tee -a dnsmasq.conf"
    @async_internet_dns_server = AsyncExecutor.new(host: @internet_dns_server, result_file: 'log/dns.log')
    @async_internet_dns_server.exec "dnsmasq -C dnsmasq.conf"
    @dns_server.exec "dig @#{@internet_dns_server.ip_address} www.google.com A > log/dns.log"
  end
end

Then(/^名前解決に成功$/) do
  step %(the file "log/dns.log" should contain "172.217.25.196")
end

