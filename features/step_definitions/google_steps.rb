# coding: utf-8
Given(/^Web ブラウザを起動する開発者 PC$/) do
  @browser_pc = Netns.new(attributes_for(:browser_pc))
end

Given(/^Google のページを起動するWebサーバ$/) do
  @google_pc = Netns.new(attributes_for(:google_pc))
end

When(/^ブラウザで Google のページを開く$/) do
  system "sudo mkdir -p /etc/netns/browser_pc"
  system "sudo echo '10.10.10.4 google.com' > /etc/netns/browser_pc/hosts"
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    system "ip netns exec google_pc echo '<title>Google</title>' | ip netns exec google_pc nc -l -p 80 > log/nc.log &"
    @browser_pc.exec 'curl -L http://google.com/ | iconv -f SHIFT-JIS -t UTF8 > log/google.log'
  end
end

Then(/^Google のトップページが表示$/) do
  step %(the file "log/google.log" should contain "<title>Google</title>")
end
