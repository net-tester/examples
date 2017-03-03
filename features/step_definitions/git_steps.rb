# coding: utf-8
When(/^資産管理サーバへ git$/) do
  cd('.') do
    @asset_service = AsyncExecutor.new(host: @asset_host, result_file: 'log/asset_host.log')
    @asset_service.exec "bash -c 'echo AccessOK | nc -l 11000'"
    @src_host.exec "nc -v #{@asset_host.ip_address} 11000 > log/access.log"
  end
end

