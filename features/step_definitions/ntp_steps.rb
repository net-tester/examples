# coding: utf-8
Given(/^NTP クライアントとなる開発者 PC$/) do
  @ntp_client = create(:ntp_client, physical_port_number: 2)
end

When(/^インターネット上の NTP サーバで開発者 PC の時刻を同期$/) do
  cd('.') do
    @ntp_client.exec 'ntpdate -q ntp.nict.jp > log/ntpdate.log'
  end
end

Then(/^時刻の同期に成功$/) do
  step %(the file "log/ntpdate.log" should contain "adjust time server")
end
