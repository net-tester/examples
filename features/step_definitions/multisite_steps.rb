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
    attributes.delete(:tester_set_name)
    @nodes[each['ノード']] = RemoteNetns.new(attributes)
  end
end

# 要件を表にまとめた場合
Given(/^通信要件表$/) do |table|
  @requirements = []
  table.hashes.each do |each|
    @requirements << {src: each['送信元'], dest: each['送信先'], access: each['通信可否']}
  end
end

When(/^通信要件どおりに ping$/) do
  @requirements.each do |requirement|
    src_host_name = requirement[:src]
    dest_host_name = requirement[:dest]
    @src_host = @nodes[src_host_name]
    @dest_host = @nodes[dest_host_name]
    @src_host.exec "bash -c 'ping #{@dest_host.ip_address} -c 1; exit 0'"
    @src_host.exec "ping #{@dest_host.ip_address} -c 4 > log/ping.log"
    collect_logs("ping_#{src_host_name}_#{dest_host_name}")
  end
end

Then(/^通信要件どおりに ping 成功$/) do
  @requirements.each do |requirement|
    src_host_name = requirement[:src]
    dest_host_name = requirement[:dest]
    tester_set_name = attributes_for("#{src_host_name}_host")[:tester_set_name]
    step %(the file "log/ping_#{src_host_name}_#{dest_host_name}/#{tester_set_name}/ping.log" should contain "4 received, 0% packet loss")
  end
end

