# coding: utf-8
Given(/^ヨーヨーダイン社内部のクライアント$/) do
  @internal_pc = Netns.new(attributes_for(:internal_pc))
end

Given(/^ヨーヨーダイン社内部の資産管理サーバ$/) do
  @asset_server = Netns.new(attributes_for(:git_server))
end

Given(/^ヨーヨーダイン社内部のテスト環境サーバ$/) do
  @test_server = Netns.new(attributes_for(:test_server))
end

Given(/^ヨーヨーダイン社のDMZ内のDNSサーバ$/) do
  @dns_server = Netns.new(attributes_for(:dns_server))
end

Given(/^ヨーヨーダイン社のDMZ内部のサーバ$/) do
  @dmz_server = Netns.new(attributes_for(:dmz_server))
end

Given(/^ヨーヨーダイン社の VPN サーバ$/) do
  @vpn_server = Netns.new(attributes_for(:vpn_server))
end

Given(/^ヨーヨーダイン社のDMZ内部のVPNアドレスプール$/) do
  @vpn_address_pool = Netns.new(attributes_for(:vpn_address_pool))
end

Given(/^Internet上のPC$/) do
  @internet_pc = Netns.new(attributes_for(:internet_pc))
end

Given(/^Internet上のDNSサーバ$/) do
  @internet_dns_server = Netns.new(attributes_for(:internet_dns))
end

Given(/^Internet上のサーバ$/) do
  @internet_server = Netns.new(attributes_for(:internet_server))
end

Given(/^タジマックス工業の PC$/) do
  @tajimax_pc = Netns.new(attributes_for(:tajimax_pc))
end

Given(/^タジマックス工業のPCをVPNクライアントに$/) do
  step %(タジマックス工業の PC)
end


