# coding: utf-8
Given(/^Web ブラウザを起動する開発者 PC$/) do
  @browser_pc = Netns.new(attributes_for(:browser_pc))
end

When(/^ブラウザで Google のページを開く$/) do
  cd('.') do
    @browser_pc.exec 'curl -L https://www.google.com/ | iconv -f SHIFT-JIS -t UTF8 > log/google.log'
  end
end

Then(/^Google のトップページが表示$/) do
  step %(the file "log/google.log" should contain "<title>Google</title>")
end
