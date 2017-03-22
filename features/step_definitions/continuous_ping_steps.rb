# coding: utf-8

When(/^タジマックス社の PC から VPN サーバに ping を連続実行$/) do
  cd('.') do
    @ping_client = AsyncExecutor.new(host: @tajimax_pc, result_file: 'log/ping_a.log')
    @ping_client.exec("ping -D -i 0.1 -c 300 203.0.113.5")
  end
end

When(/^社内 PC から DMZ サーバに ping を連続実行$/) do
  cd('.') do
    @ping_client = AsyncExecutor.new(host: @user_pc, result_file: 'log/ping_b.log')
    @ping_client.exec("ping -D -i 0.1 -c 300 #{@dmz_host.ip_address}")
  end
end

When(/^社内 PC からインターネット上の PC に ping を連続実行$/) do
  cd('.') do
    @ping_client = AsyncExecutor.new(host: @user_pc, result_file: 'log/ping_c.log')
    @ping_client.exec("ping -D -i 0.1 -c 300 #{@internet_pc.ip_address}")
  end
end

Then(/^タジマックス社の PC から VPN サーバへの ping が (\d+) 秒以内に復帰$/) do |seconds|
  @ping_client.join
  cd('.') do
    _, time_diff = check_connection('log/ping_a.log')
    expect(time_diff).to be <= seconds.to_f
  end
end

Then(/^社内 PC から DMZ のサーバへの ping が (\d+) 秒以内に復帰$/) do |seconds|
  @ping_client.join
  cd('.') do
    _, time_diff = check_connection('log/ping_b.log')
    expect(time_diff).to be <= seconds.to_f
  end
end

Then(/^社内 PC からインターネット上の PC への ping が (\d+) 秒以内に復帰$/) do |seconds|
  @ping_client.join
  cd('.') do
    _, time_diff = check_connection('log/ping_c.log')
    expect(time_diff).to be <= seconds.to_f
  end
end
