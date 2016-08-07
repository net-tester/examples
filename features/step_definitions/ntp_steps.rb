# coding: utf-8
When(/^NTP サーバ "([^"]*)" で PC の時刻を同期$/) do |ntp_server|
  @ntp_client.exec "ntpdate -q #{ntp_server} > ntpdate.log"
end

Then(/^時刻の同期に成功$/) do
  step %(the file "ntpdate.log" should contain "adjust time server")
end
