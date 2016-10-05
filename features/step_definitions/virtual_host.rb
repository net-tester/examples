Given(/^ヨーヨーダイン社のDMZ内部のサーバ$/) do
  @dmz_server = Netns.new(attributes_for(:dmz_server))
end

Given(/^ヨーヨーダイン社内部のクライアント$/) do
  @internal_pc = Netns.new(attributes_for(:internal_pc))
end
