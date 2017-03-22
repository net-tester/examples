# coding: utf-8
Given(/^社内 PC$/) do
  @user_pc = Netns.new(attributes_for(:user_pc))
end

Given(/^社内の資産管理サーバ$/) do
  @asset_host = Netns.new(attributes_for(:git_host))
end

Given(/^社内のテスト環境サーバ$/) do
  @test_host = Netns.new(attributes_for(:test_host))
end

Given(/^DMZ の DNS サーバ$/) do
  @dns_host = Netns.new(attributes_for(:dns_host))
end

Given(/^DMZ のサーバ$/) do
  @dmz_host = Netns.new(attributes_for(:dmz_host))
end

Given(/^VPN サーバ$/) do
  @vpn_host = Netns.new(attributes_for(:vpn_host))
end

Given(/^DMZ の VPN アドレスプール$/) do
  @vpn_address_pool = Netns.new(attributes_for(:vpn_address_pool))
end

Given(/^インターネット上の PC$/) do
  @internet_pc = Netns.new(attributes_for(:internet_pc))
end

Given(/^インターネット上の DNS サーバ$/) do
  @internet_dns_host = Netns.new(attributes_for(:internet_dns_host))
end

Given(/^インターネット上の NTP サーバ$/) do
  @internet_ntp_host = Netns.new(attributes_for(:internet_ntp_host))
end

Given(/^インターネット上のサーバ$/) do
  @internet_host = Netns.new(attributes_for(:internet_host))
end

Given(/^インターネット上のパッケージサーバ$/) do
  step %(インターネット上のサーバ)
end

Given(/^タジマックス社の PC$/) do
  @tajimax_pc = Netns.new(attributes_for(:tajimax_pc))
end

Given(/^タジマックス社の PC を VPN クライアントに$/) do
  step %(タジマックス社の PC)
end


