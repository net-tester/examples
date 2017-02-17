# coding: utf-8
Given(/^NTP クライアントとなる開発者 PC$/) do
  @ntp_client = Netns.new(attributes_for(:ntp_client))
end

When(/^インターネット上の NTP サーバで開発者 PC の時刻を同期$/) do
  cd('.') do
    @ntp_client.exec 'ntpdate -q ntp.nict.jp > log/ntpdate.log'
  end
end

When(/^時刻を udp で同期$/) do
  cd('.') do
    @async_internet_ntp_server = AsyncExecutor.new(host: @internet_ntp_server, result_file: 'log/server.log')
    @async_internet_ntp_server.exec "bash -c 'echo -e \"adjust time server\" | nc -lu 123'"
    @dmz_server.exec "nc -uv -w4 #{@internet_ntp_server.ip_address} 123 > log/ntpdate.log"
  end
end

When(/^時刻を tcp で同期$/) do
  cd('.') do
    @async_internet_ntp_server = AsyncExecutor.new(host: @internet_ntp_server, result_file: 'log/server.log')
    @async_internet_ntp_server.exec "bash -c 'echo -e \"adjust time server\" | nc -l 123'"
    @dmz_server.exec "nc #{@internet_ntp_server.ip_address} 123 > log/ntpdate.log"
  end
end
