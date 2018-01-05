# coding: utf-8

When(/^タジマックス社の PC から VPN サーバに ping を連続実行$/) do
  cd('.') do
    @ping_client = @tajimax_pc
    @process_id = @ping_client.exec("ping -D -i 0.1 -c 300 203.0.113.5")
  end
end

When(/^社内 PC から DMZ サーバに ping を連続実行$/) do
  cd('.') do
    @ping_client = @user_pc
    @process_id = @ping_client.exec("ping -D -i 0.1 -c 300 #{@dmz_host.ip_address}")
  end
end

When(/^社内 PC からインターネット上の PC に ping を連続実行$/) do
  cd('.') do
    @ping_client = @user_pc
    @process_id = @ping_client.exec("ping -D -i 0.1 -c 300 #{@internet_pc.ip_address}")
  end
end

Then(/^タジマックス社の PC から VPN サーバへの ping が (\d+) 秒以内に復帰$/) do |seconds|
  result = @ping_client.result(@process_id)
  cd('.') do
    _, time_diff = check_connection(result)
    expect(time_diff).to be <= seconds.to_f
  end
end

Then(/^社内 PC から DMZ のサーバへの ping が (\d+) 秒以内に復帰$/) do |seconds|
  result = @ping_client.result(@process_id)
  cd('.') do
    _, time_diff = check_connection(result)
    expect(time_diff).to be <= seconds.to_f
  end
end

Then(/^社内 PC からインターネット上の PC への ping が (\d+) 秒以内に復帰$/) do |seconds|
  result = @ping_client.result(@process_id)
  cd('.') do
    _, time_diff = check_connection(result)
    expect(time_diff).to be <= seconds.to_f
  end
end
