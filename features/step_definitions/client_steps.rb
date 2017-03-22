# coding: utf-8
When(/^社内 PC にログイン$/) do
  @src_host = @user_pc
end

When(/^DMZ のサーバにログイン$/) do
  @src_host = @dmz_host
end

When(/^DMZ の DNS サーバにログイン$/) do
  @src_host = @dns_host
end

When(/^VPN サーバにログイン$/) do
  @src_host = @vpn_host
end

When(/^DMZ の VPN アドレスプールにログイン$/) do
  @src_host = @vpn_address_pool
end

When(/^インターネット上の PC にログイン$/) do
  @src_host = @internet_pc
end

When(/^タジマックス社の PC にログイン$/) do
  @src_host = @tajimax_pc
end
