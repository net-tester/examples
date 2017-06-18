# coding: utf-8
Given(/^ヨーヨーダイン社内部のユーザ PC$/) do
  @user_pc = Netns.new(attributes_for(:user_pc))
end

Given(/^ヨーヨーダイン社内部のクライアント$/) do
  @internal_pc = Netns.new(attributes_for(:internal_pc))
end

Given(/^ヨーヨーダイン社内部の資産管理サーバ$/) do
  @asset_server = Netns.new(attributes_for(:git_server))
end

Given(/^ヨーヨーダイン社内部のテスト環境サーバ$/) do
  @test_server = Netns.new(attributes_for(:test_server))
end

Given(/^ヨーヨーダイン社の DMZ の DNS サーバ$/) do
  @dns_server = Netns.new(attributes_for(:dns_server))
end

Given(/^ヨーヨーダイン社の DMZ のサーバ$/) do
  @dmz_server = Netns.new(attributes_for(:dmz_server))
end

Given(/^ヨーヨーダイン社の VPN サーバ$/) do
  @vpn_server = Netns.new(attributes_for(:vpn_server))
end

Given(/^ヨーヨーダイン社のDMZ内部のVPNアドレスプール$/) do
  @vpn_address_pool = Netns.new(attributes_for(:vpn_address_pool))
end

Given(/^インターネット上の PC$/) do
  @internet_pc = Netns.new(attributes_for(:internet_pc))
end

Given(/^インターネット上の DNS サーバ$/) do
  @internet_dns_server = Netns.new(attributes_for(:internet_dns))
end

Given(/^インターネット上のサーバ$/) do
  @internet_server = Netns.new(attributes_for(:internet_server))
end

Given(/^タジマックス工業の PC$/) do
  @tajimax_pc = Netns.new(attributes_for(:tajimax_pc))
end

Given(/^タジマックス工業のPCをVPNクライアントに$/) do
  step %(タジマックス工業の PC)
end


