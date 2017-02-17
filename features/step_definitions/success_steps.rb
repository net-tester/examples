Then(/^ログイン成功$/) do
  step %(the file "log/login.log" should contain "LoginOK")
end

Then(/^アップデート成功$/) do
  step %(the file "log/update.log" should contain "UpdateOK")
end
