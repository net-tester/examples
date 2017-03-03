# coding: utf-8
When(/^DMZ の DNS サーバに dig コマンドで "www.google.com" の IP アドレスを問い合わせる$/) do
  cd('.') do
    @dns_host.exec "mkdir -p /etc/netns/#{@dns_host.name}"
    @dns_host.exec "echo '172.217.25.196 www.google.com' | sudo tee /etc/netns/#{@dns_host.name}/hosts"
    @dns_host.exec "echo 'port=53' | sudo tee dnsmasq.conf"
    @dns_host.exec "echo 'expand-hosts' | sudo tee -a dnsmasq.conf"
    @dns_service = AsyncExecutor.new(host: @dns_host, result_file: 'log/dns.log')
    @dns_service.exec "dnsmasq -C dnsmasq.conf"
    @src_host.exec "dig @#{@dns_host.ip_address} www.google.com A > log/dns.log"
  end
end

When(/^インターネット上の DNS サーバに dig コマンドで "www.google.com" の IP アドレスを問い合わせる$/) do
  cd('.') do
    @internet_dns_host.exec "mkdir -p /etc/netns/#{@internet_dns_host.name}"
    @internet_dns_host.exec "echo '172.217.25.196 www.google.com' | sudo tee /etc/netns/#{@internet_dns_host.name}/hosts"
    @internet_dns_host.exec "echo 'port=53' | sudo tee dnsmasq.conf"
    @internet_dns_host.exec "echo 'expand-hosts' | sudo tee -a dnsmasq.conf"
    @dns_service = AsyncExecutor.new(host: @internet_dns_host, result_file: 'log/dns.log')
    @dns_service.exec "dnsmasq -C dnsmasq.conf"
    @src_host.exec "dig @#{@internet_dns_host.ip_address} www.google.com A > log/dns.log"
  end
end

Then(/^名前解決に成功$/) do
  step %(the file "log/dns.log" should contain "172.217.25.196")
end
