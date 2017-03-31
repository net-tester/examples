# coding: utf-8

# とりあえずここに書いてあとでバラす
# NetTesterの起動はBeforeからここに移動
Given(/^拠点 note$/) do
  device = ENV['DEVICE'] || 'eth1'
  dpid = ENV['DPID'].try(&:hex) || 0x123
  NetTester.run_on(tester_set: tester_sets[:note], network_device: device, physical_switch_dpid: dpid)
  sleep 2
end

Given(/^ノード note1$/) do
  @note1_attribute = attributes_for(:note1_host)
end

Given(/^拠点 tama$/) do
  device = ENV['DEVICE'] || 'eth1'
  dpid = ENV['DPID'].try(&:hex) || 0x123
  NetTester.run_on(tester_set: tester_sets[:tama], network_device: device, physical_switch_dpid: dpid)
  sleep 2
end

Given(/^ノード tama1$/) do
  @tama1_attribute = attributes_for(:tama1_host)
end

Given(/^VLAN ID (\d+)$/) do |arg1|
  # VLANを後で設定する、はnetnsを作ってしまうと無理なので、
  # 既存機構で作ろうとおもうと「VLANを設定するまではattributeでもつ」「VLAN設定のときにnetnsつくる」になる
  @note1_attribute[:vlan_id] = arg1
  @tama1_attribute[:vlan_id] = arg1
  @note1_host = RemoteNetns.new(@note1_attribute)
  @tama1_host = RemoteNetns.new(@tama1_attribute)
end

When(/^note1 にログイン$/) do
  @src_host = @note1_host
end

When(/^tama1 に ping$/) do
  # cdするとENVが消えてsshに失敗するようになる(HOMEがないといわれる。見てみるとほぼ全部envきえてる)
  # これは理由がわからないので困ってます！
  # が、そもそもsshしてからcdしないといけないのでここのcdは不要なため削除
  #cd('.') do
    @src_host.exec "bash -c 'ping #{@tama1_host.ip_address} -c 1; exit 0'"
    @src_host.exec "ping #{@tama1_host.ip_address} -c 4 > log/ping.log"
  #end
end

