# coding: utf-8

Given(/^ヨーヨーダイン社 の Git リポジトリサーバ$/) do
  @git_server = Netns.new(attributes_for(:git_server))
  cd('.') do
    @async_git_server = AsyncExecutor.new(host: @git_server, result_file: 'log/git_server.log')
    @async_git_server.exec "bash -c 'echo OK | nc -l 11000'"
  end
end

Given(/^Git クライアントとなる開発者 PC$/) do
  @git_client = Netns.new(attributes_for(:git_client))
end

When(/^開発者 PC から社内 Git リポジトリへアクセス$/) do
  cd('.') do
    @git_client.exec "nc -v #{@git_server.ip_address} 11000 > log/nc_git.log"
  end
end

When(/^資産管理サーバへ git$/) do
  cd('.') do
    @async_asset_server = AsyncExecutor.new(host: @asset_server, result_file: 'log/server.log')
    @async_asset_server.exec "bash -c 'echo AccessOK | nc -l 11000'"    
    @vpn_address_pool.exec "nc -v #{@asset_server.ip_address} 11000 > log/access.log"
  end
end

Then(/^社内 Git リポジトリにアクセス成功$/) do
  step %(the file "log/nc_git.log" should contain "OK")
end
