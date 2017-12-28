require 'faker'
require 'httpclient'
require File.expand_path("../tester_sets.rb", __FILE__)

class TestNode
  def initialize(attributes, vlan_id = nil)
    @http_client = HTTPClient.new
    attributes[:vlan_id] = vlan_id unless vlan_id.nil?
    @name = attributes[:name]
    @tester_set_name = attributes[:tester_set_name]
    @ip_address = attributes[:ip_address]
    @tester_set = tester_sets[@tester_set_name]
    @apiroot = "http://#{@tester_set[:ip_address]}:3000/"
    attributes.delete(:name)
    attributes.delete(:tester_set_name)
    res = @http_client.put(@apiroot + "hosts/#{@name}", attributes.to_json, 'Content-Type' => 'application/json')
    if (res.code / 100).to_i != 2 then
      fail(StandardError.new("Cannot create node (site:#{@tester_set_name}, host:#{@name}, code:#{res.code}), detail:#{res.body}"))
    end
  end

  attr_reader :ip_address, :name, :tester_set

  def exec(cmd, attributes = {})
    sync = attributes[:sync]
    delayed = attributes[:delayed]
    request = {
      host_name: @name,
      command: cmd,
      initial_wait: delayed ? 3 : 0,
      process_wait: 0
    }
    res = @http_client.post("#{@apiroot}processes", request.to_json, 'Content-Type' => 'application/json')
    if (res.code / 100).to_i != 2 then
      fail(StandardError.new("Cannot execute process (site:#{@tester_set_name}, host:#{@name}, code:#{res.code}), detail:#{res.body}"))
    end
    result = JSON.parse(res.body)
    id = result["id"].to_s
    result(id) if sync
    id
  end

  def result(id)
    while(1) do
      res = @http_client.get("#{@apiroot}processes/#{id}")
      if (res.code / 100).to_i != 2 then
        fail(StandardError.new("Cannot get process info (site:#{@tester_set_name}, host:#{@name}, pid:#{id}, code:#{res.code}), detail:#{res.body}"))
      end
      result = JSON.parse(res.body)
      if(result["status"] == "finished") then
        return result["stdout"]
      end
      sleep 1
    end
  end
end
