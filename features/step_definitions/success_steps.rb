Then(/^ログイン成功$/) do
  step %(the file "log/login.log" should contain "LoginOK")
end

Then(/^アップデート成功$/) do
  step %(the file "log/update.log" should contain "UpdateOK")
end

Then(/^時刻の同期に成功$/) do
  step %(the file "log/ntpdate.log" should contain "adjust time server")
end

Then(/^ping 成功$/) do
  step %(the file "log/ping.log" should contain "4 received, 0% packet loss")
end

