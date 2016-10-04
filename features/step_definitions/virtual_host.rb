Given(/^ヨーヨーダイン社内部のクライアント$/) do
  @internal_pc = Netns.new(attributes_for(:internal_pc))
end

Given(/^ヨーヨーダイン社内部の資産管理サーバ$/) do
  @asset_server = Netns.new(attributes_for(:git_server))
end
