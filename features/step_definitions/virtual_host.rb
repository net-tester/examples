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

Given(/^Internet上のPC$/) do
  @internet_pc = Netns.new(attributes_for(:internet_pc))
end
