# coding: utf-8

When(/^タジマックス社の PC から VPN サーバに TCP で接続$/) do
  cd('.') do
    @echo_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/tcp_server.log')
    @echo_service.exec("../../features/support/echo_server.pl 80")

    @echo_client = AsyncExecutor.new(host: @tajimax_pc, result_file: 'log/tcp_a.log')
    @echo_client.exec("../../features/support/echo_client.pl 203.0.113.5 80 30")
  end
end

When(/^社内の資産管理サーバに DMZ の VPN アドレスプールから TCP で接続$/) do
  cd('.') do
    @echo_service = AsyncExecutor.new(host: @asset_host, result_file: 'log/tcp_server.log')
    @echo_service.exec("../../features/support/echo_server.pl 11000")

    @echo_client = AsyncExecutor.new(host: @vpn_address_pool, result_file: 'log/tcp_b.log')
    @echo_client.exec("../../features/support/echo_client.pl #{@asset_host.ip_address} 11000 30")
  end
end

Then(/^タジマックス社の PC から VPN サーバへの TCP 接続が切れていない$/) do
  @echo_client.join
  cd('.') do
    line_count, _ = check_connection('log/tcp_a.log')
    expect(line_count).to be == 30
  end
end

Then(/^DMZ の VPN アドレスプールから社内の資産管理サーバへの TCP 接続が切れていない$/) do
  @echo_client.join
  cd('.') do
    line_count, _ = check_connection('log/tcp_b.log')
    expect(line_count).to be == 30
  end
end
