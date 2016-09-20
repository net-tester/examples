# coding: utf-8

Given(/^ヨーヨーダイン社 の Git リポジトリサーバ$/) do
  @git_server = Netns.new(attributes_for(:git_server))
  # FIXME: @git_server.exec "bash -c 'echo OK | nc -l 11000 &'"
  Thread.start { @git_server.exec "bash -c 'echo OK | nc -l 11000'" }
  sleep 3
end

Given(/^Git クライアントとなる開発者 PC$/) do
  @git_client = Netns.new(attributes_for(:git_client))
end

When(/^開発者 PC から社内 Git リポジトリへアクセス$/) do
  cd('.') do
    @git_client.exec "nc -v #{@git_server.ip_address} 11000 > log/nc_git.log"
  end
end

Then(/^社内 Git リポジトリにアクセス成功$/) do
  step %(the file "log/nc_git.log" should contain "OK")
end
