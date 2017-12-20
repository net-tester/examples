# coding: utf-8
When(/^DMZ の DNS サーバに dig コマンドで "www.google.com" の IP アドレスを問い合わせる$/) do
  cd('.') do
    @dns_host.exec("mkdir -p /etc/netns/#{@dns_host.name}", sync: true)
    @dns_host.exec("echo '172.217.25.196 www.google.com' | sudo tee /etc/netns/#{@dns_host.name}/hosts", sync: true)
    @dns_host.exec("echo 'port=53' | sudo tee dnsmasq.conf", sync: true)
    @dns_host.exec("echo 'expand-hosts' | sudo tee -a dnsmasq.conf", sync: true)
    @dns_service = @dns_host
    @dns_service.exec("dnsmasq -C dnsmasq.conf")
    @process_id = @src_host.exec("dig @#{@dns_host.ip_address} www.google.com A", delayed: true)
  end
end

When(/^インターネット上の DNS サーバに dig コマンドで "www.google.com" の IP アドレスを問い合わせる$/) do
  cd('.') do
    @internet_dns_host.exec("mkdir -p /etc/netns/#{@internet_dns_host.name}", sync: true)
    @internet_dns_host.exec("echo '172.217.25.196 www.google.com' | sudo tee /etc/netns/#{@internet_dns_host.name}/hosts", sync: true)
    @internet_dns_host.exec("echo 'port=53' | sudo tee dnsmasq.conf", sync: true)
    @internet_dns_host.exec("echo 'expand-hosts' | sudo tee -a dnsmasq.conf", sync: true)
    @dns_service = @internet_dns_host
    @dns_service.exec("dnsmasq -C dnsmasq.conf")
    @process_id = @src_host.exec("dig @#{@internet_dns_host.ip_address} www.google.com A", delayed: true)
  end
end
