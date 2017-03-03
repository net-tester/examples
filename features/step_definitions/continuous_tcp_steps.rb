# coding: utf-8

When(/^ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからTCP接続を開始$/) do
  cd('.') do
    @echo_service = AsyncExecutor.new(host: @vpn_host, result_file: 'log/tcp_server.log')
    @echo_service.exec("../../features/support/echo_server.pl 80")

    @echo_client = AsyncExecutor.new(host: @tajimax_pc, result_file: 'log/tcp_a.log')
    @echo_client.exec("../../features/support/echo_client.pl 203.0.113.5 80 30")
  end
end

When(/^ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社のDMZ内部のVPNアドレスプールからTCP接続を開始$/) do
  cd('.') do
    @echo_service = AsyncExecutor.new(host: @asset_host, result_file: 'log/tcp_server.log')
    @echo_service.exec("../../features/support/echo_server.pl 11000")

    @echo_client = AsyncExecutor.new(host: @vpn_address_pool, result_file: 'log/tcp_b.log')
    @echo_client.exec("../../features/support/echo_client.pl #{@asset_host.ip_address} 11000 30")
  end
end

Then(/^ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのTCP接続が維持されている$/) do
  @echo_client.join
  cd('.') do
    line_count, _ = check_connection('log/tcp_a.log')
    expect(line_count).to be == 30
  end
end

Then(/^ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社のDMZ内部のVPNアドレスプールからTCP接続が維持されている$/) do
  @echo_client.join
  cd('.') do
    line_count, _ = check_connection('log/tcp_b.log')
    expect(line_count).to be == 30
  end
end
