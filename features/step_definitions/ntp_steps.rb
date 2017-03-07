# coding: utf-8
When(/^時刻をインターネット上の NTP サーバと同期$/) do
  cd('.') do
    @src_host.exec 'ntpdate -q ntp.nict.jp > log/ntpdate.log'
  end
end

When(/^時刻をインターネット上の NTP サーバと udp で同期$/) do
  cd('.') do
    @ntp_service = AsyncExecutor.new(host: @internet_ntp_host, result_file: 'log/internet_ntp_host.log')
    @ntp_service.exec "bash -c 'echo -e \"adjust time server\" | nc -lu 123'"
    @src_host.exec "nc -uv -w4 #{@internet_ntp_host.ip_address} 123 > log/ntpdate.log"
  end
end

When(/^時刻をインターネット上の NTP サーバと tcp で同期$/) do
  cd('.') do
    @ntp_service = AsyncExecutor.new(host: @internet_ntp_host, result_file: 'log/internet_ntp_host.log')
    @ntp_service.exec "bash -c 'echo -e \"adjust time server\" | nc -l 123'"
    @src_host.exec "nc #{@internet_ntp_host.ip_address} 123 > log/ntpdate.log"
  end
end
