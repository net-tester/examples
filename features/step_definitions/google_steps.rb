# coding: utf-8
Given(/^Web ブラウザを起動する開発者 PC$/) do
  @browser_pc = Netns.new(attributes_for(:browser_pc))
end

Given(/^Google のページを起動するWebサーバ$/) do
  @google_pc = Netns.new(attributes_for(:google_pc))
  cd('.') do
    system "sudo mkdir -p /etc/netns/browser_pc"
    system "sudo echo '10.10.10.4 google.com' > /etc/netns/browser_pc/hosts"
    system "sudo yes '' | sudo openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout server.key -out server.crt -days 30"
    system "sudo ip netns exec google_pc echo '<title>Google</title>' | sudo ip netns exec google_pc openssl s_server -cert server.crt -key server.key -accept 443 > log/s_server.log &"
  end
end

When(/^ブラウザで Google のページを開く$/) do
  cd('.') do
    @browser_pc.exec 'curl -L --insecure  https://google.com/ | iconv -f SHIFT-JIS -t UTF8 > log/google.log'
  end
end

Then(/^Google のトップページが表示$/) do
  step %(the file "log/google.log" should contain "<title>Google</title>")
end
