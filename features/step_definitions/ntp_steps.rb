# coding: utf-8
When(/^時刻をインターネット上の NTP サーバと同期$/) do
  cd('.') do
    @process_id = @src_host.exec('ntpdate -q ntp.nict.jp')
  end
end

When(/^時刻をインターネット上の NTP サーバと同期 \(UDP\)$/) do
  cd('.') do
    @ntp_service = @internet_ntp_host
    @ntp_service.exec("bash -c 'echo -e \"adjust time server\" | nc -lu 123'")
    @process_id = @src_host.exec("nc -uv -w4 #{@internet_ntp_host.ip_address} 123", delayed: true)
  end
end

When(/^時刻をインターネット上の NTP サーバと同期 \(TCP\)$/) do
  cd('.') do
    @ntp_service = @internet_ntp_host
    @ntp_service.exec("bash -c 'echo -e \"adjust time server\" | nc -l 123'")
    @process_id = @src_host.exec("nc #{@internet_ntp_host.ip_address} 123", delayed: true)
  end
end
