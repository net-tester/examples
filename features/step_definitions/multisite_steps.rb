# coding: utf-8

Given(/^VLAN ID (\d+) のユーザグループ$/) do |vlan_id, table|
  table.hashes.each do |each|
    attributes = attributes_for("#{each['ノード']}_host".to_sym)
    attributes[:vlan_id] = vlan_id.to_i
    attributes.delete(:tester_set_name)
    attributes.delete(:tester_set)
    attributes.delete(:name)

    tester_set = tester_sets[each['拠点']]
    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    @http_client.put(apiroot + "hosts/#{each['ノード']}", attributes.to_json, 'Content-Type' => 'application/json')
    # TODO: error catch
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
    src_host = attributes_for("#{src_host_name}_host".to_sym)
    dest_host = attributes_for("#{dest_host_name}_host".to_sym)

    tester_set = tester_sets[src_host[:tester_set_name]]
    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    # 捨てping
    src_host_command = {
      :host_name => src_host_name,
      :command => "ping #{dest_host[:ip_address]} -c 1"
    }
    res = @http_client.post(apiroot+"processes", src_host_command.to_json, 'Content-Type' => 'application/json')
    result = JSON.parse(res.body)
    id = result["id"]
    # 捨てpingが終わるのを待つ
    while(1) do
      res = @http_client.get(apiroot + "processes/" + id)
      result = JSON.parse(res.body)
      if(result["status"] == "finished") then
        break
      end
      sleep 1
    end

    # 本チャン
    src_host_command = {
      :host_name => src_host_name,
      :command => "ping #{dest_host[:ip_address]} -c 4"
    }
    res = @http_client.post(apiroot+"processes", src_host_command.to_json, 'Content-Type' => 'application/json')
    result = JSON.parse(res.body)
    requirement[:id] = result["id"]
  end
end

Then(/^通信要件どおりに ping 成功$/) do
  @requirements.each do |requirement|
    src_host_name = requirement[:src]
    dest_host_name = requirement[:dest]
    src_host = attributes_for("#{src_host_name}_host".to_sym)
    dest_host = attributes_for("#{dest_host_name}_host".to_sym)

    tester_set = tester_sets[src_host[:tester_set_name]]

    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    while(1) do
      res = @http_client.get(apiroot + "processes/" + requirement[:id])
      result = JSON.parse(res.body)
      if(result["status"] == "finished") then
        break
      end
      sleep 1
    end

    if(requirement[:access] == 'O') then
      expect(result["stdout"]).to match /4 received, 0% packet loss/
    else
      expect(result["stdout"]).to match /100% packet loss/
    end
  end
end

