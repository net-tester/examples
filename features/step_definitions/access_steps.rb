Then(/^アクセス成功$/) do
  step %(the file "log/access.log" should contain "AccessOK")
end
