Given(/^ヨーヨーダイン 社内部のクライアント$/) do
  @internal_pc = Netns.new(attributes_for(:internal_pc))
end

Given(/^資産管理サーバ$/) do
  @asset_server = Netns.new(attributes_for(:git_server))
end
