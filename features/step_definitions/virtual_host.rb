Given(/^ヨーヨーダイン 社内部のクライアント$/) do
  @internal_pc = Netns.new(attributes_for(:internal_pc))
end

Given(/^テスト環境サーバ$/) do
  @test_server = Netns.new(attributes_for(:test_server))
end
