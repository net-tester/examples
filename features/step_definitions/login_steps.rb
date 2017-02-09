Then(/^ログイン成功$/) do
  step %(the file "log/login.log" should contain "LoginOK")
end

