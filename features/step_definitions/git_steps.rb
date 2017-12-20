# coding: utf-8
When(/^資産管理サーバへ git$/) do
  cd('.') do
    @asset_service = @asset_host
    @asset_service.exec("bash -c 'echo AccessOK | nc -l 11000'")
    @process_id = @src_host.exec("nc -v #{@asset_host.ip_address} 11000", delayed: true)
  end
end

