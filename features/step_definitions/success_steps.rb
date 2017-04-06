Then(/^アクセス成功$/) do
  step %(the file "log/access.log" should contain "AccessOK")
end

Then(/^ログイン成功$/) do
  step %(アクセス成功)
end

Then(/^アップデート成功$/) do
  step %(アクセス成功)
end

Then(/^時刻の同期に成功$/) do
  step %(the file "log/ntpdate.log" should contain "adjust time server")
end

Then(/^ping 成功$/) do
  step %(the file "log/ping.log" should contain "4 received, 0% packet loss")
end

Then(/^Google のトップページが表示$/) do
  step %(the file "log/google.log" should contain "<title>Google</title>")
end
