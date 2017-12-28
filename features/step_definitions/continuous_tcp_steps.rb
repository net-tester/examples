# coding: utf-8

When(/^タジマックス社の PC から VPN サーバに TCP で接続$/) do
  cd('.') do
    upload_testlet(@vpn_host.tester_set, File.expand_path('../../features/support/echo_server.pl'))
    upload_testlet(@tajimax_pc.tester_set, File.expand_path('../../features/support/echo_client.pl'))

    @echo_service = @vpn_host
    @echo_service.exec('perl tmp/aruba/testlets/echo_server.pl 80')

    @echo_client = @tajimax_pc
    @process_id = @echo_client.exec('perl tmp/aruba/testlets//echo_client.pl 203.0.113.5 80 30', delayed: true)
  end
end

When(/^社内の資産管理サーバに DMZ の VPN アドレスプールから TCP で接続$/) do
  cd('.') do
    upload_testlet(@asset_host.tester_set, File.expand_path('../../features/support/echo_server.pl'))
    upload_testlet(@vpn_address_pool.tester_set, File.expand_path('../../features/support/echo_client.pl'))

    @echo_service = @asset_host
    @echo_service.exec('perl tmp/aruba/testlets/echo_server.pl 11000')

    @echo_client = @vpn_address_pool
    @process_id = @echo_client.exec("perl tmp/aruba/testlets/echo_client.pl #{@asset_host.ip_address} 11000 30", delayed: true)
  end
end

Then(/^タジマックス社の PC から VPN サーバへの TCP 接続が切れていない$/) do
  result = @echo_client.result(@process_id)
  cd('.') do
    line_count, _ = check_connection(result)
    expect(line_count).to be == 30
  end
end

Then(/^DMZ の VPN アドレスプールから社内の資産管理サーバへの TCP 接続が切れていない$/) do
  result = @echo_client.result(@process_id)
  cd('.') do
    line_count, _ = check_connection(result)
    expect(line_count).to be == 30
  end
end
