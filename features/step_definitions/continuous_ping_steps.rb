# coding: utf-8

When(/^ヨーヨーダイン社の VPN サーバにタジマックス社の PC から ping を連続実行$/) do
  cd('.') do
    @ping_client = AsyncExecutor.new(host: @tajimax_pc, result_file: 'log/ping_a.log')
    @ping_client.exec("ping -D -i 0.1 -c 300 203.0.113.5")
  end
end

When(/^DMZ サーバにヨーヨーダイン社内部のユーザ PC から ping を連続実行$/) do
  cd('.') do
    @ping_client = AsyncExecutor.new(host: @user_pc, result_file: 'log/ping_b.log')
    @ping_client.exec("ping -D -i 0.1 -c 300 #{@dmz_host.ip_address}")
  end
end

When(/^インターネット上の PC にヨーヨーダイン社内部のユーザ PC から ping を連続実行$/) do
  cd('.') do
    @ping_client = AsyncExecutor.new(host: @user_pc, result_file: 'log/ping_c.log')
    @ping_client.exec("ping -D -i 0.1 -c 300 #{@internet_pc.ip_address}")
  end
end

Then(/^ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの ping による疎通が (\d+) 秒以内に復帰$/) do |seconds|
  @ping_client.join
  cd('.') do
    _, time_diff = check_connection('log/ping_a.log')
    expect(time_diff).to be <= seconds.to_f
  end
end

Then(/^DMZ のサーバにヨーヨーダイン社内部のユーザ PC からの ping による疎通が (\d+) 秒以内に復帰$/) do |seconds|
  @ping_client.join
  cd('.') do
    _, time_diff = check_connection('log/ping_b.log')
    expect(time_diff).to be <= seconds.to_f
  end
end

Then(/^インターネット上の PC にヨーヨーダイン社内部のユーザ PC からの ping による疎通が (\d+) 秒以内に復帰$/) do |seconds|
  @ping_client.join
  cd('.') do
    _, time_diff = check_connection('log/ping_c.log')
    expect(time_diff).to be <= seconds.to_f
  end
end
