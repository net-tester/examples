# coding: utf-8

# とりあえずここに書いてあとでバラす
# NetTesterの起動はBeforeからここに移動

Given(/^VLAN ID (\d+) のユーザグループ$/) do |vlan_id, table|
  @nodes = {}
  @testers = {}
  device = ENV['DEVICE'] || 'eth1'
  dpid = ENV['DPID'].try(&:hex) || 0x123
  table.hashes.each do |each|
    tester_set = tester_sets[each['拠点'].to_sym]
    unless @testers.key?(each['拠点']) then
      NetTester.run_on(tester_set: tester_set, network_device: device, physical_switch_dpid: dpid)
      @testers[each['拠点']] = tester_set
      sleep 2
    end
    attributes = attributes_for("#{each['ノード']}_host".to_sym)
    attributes[:vlan_id] = vlan_id
    @nodes[each['ノード']] = RemoteNetns.new(attributes)
  end
end

When(/^note1 にログイン$/) do
  @src_host = @nodes['note1']
end

When(/^tama1 に ping$/) do
  # cdするとENVが消えてsshに失敗するようになる(HOMEがないといわれる。見てみるとほぼ全部envきえてる)
  # これは理由がわからないので困ってます！
  # が、そもそもsshしてからcdしないといけないのでここのcdは不要なため削除
  #cd('.') do
    @tama1_host = @nodes['tama1']
    @src_host.exec "bash -c 'ping #{@tama1_host.ip_address} -c 1; exit 0'"
    @src_host.exec "ping #{@tama1_host.ip_address} -c 4 > log/ping.log"
  #end
end

