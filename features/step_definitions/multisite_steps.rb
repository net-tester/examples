# coding: utf-8

# とりあえずここに書いてあとでバラす
# NetTesterの起動はBeforeからここに移動
Given(/^VLAN ID (\d+) のユーザグループ$/) do |vlan_id, table|
  @nodes = {}
  @testers = {}
  table.hashes.each do |each|
    tester_set = tester_sets[each['拠点']]
    unless @testers.key?(each['拠点']) then
      NetTester.run_on(tester_set: tester_set[:ip_address], network_device: tester_set[:device], physical_switch_dpid: tester_set[:dpid])
      @testers[each['拠点']] = tester_set
    end
  end
  sleep 2
  table.hashes.each do |each|
    attributes = attributes_for("#{each['ノード']}_host".to_sym)
    attributes[:vlan_id] = vlan_id
    @nodes[each['ノード']] = RemoteNetns.new(attributes)
  end
end

When(/^(\w+) から (\w+) に ping$/) do |src_host_name, dest_host_name|
  @src_host = @nodes[src_host_name]
  @dest_host = @nodes[dest_host_name]
  @src_host.exec "bash -c 'ping #{@dest_host.ip_address} -c 1; exit 0'"
  @src_host.exec "ping #{@dest_host.ip_address} -c 4 > log/ping.log"
end

