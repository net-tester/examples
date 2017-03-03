# coding: utf-8
When(/^ヨーヨーダイン社内部のユーザ PC にログイン$/) do
  @src_host = @user_pc
end

When(/^ヨーヨーダイン社の DMZ のサーバにログイン$/) do
  @src_host = @dmz_host
end

When(/^ヨーヨーダイン社の DMZ の DNS サーバにログイン$/) do
  @src_host = @dns_host
end

When(/^ヨーヨーダイン社の DMZ の VPN アドレスプールにログイン$/) do
  @src_host = @vpn_address_pool
end
