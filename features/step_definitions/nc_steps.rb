When(/^ヨーヨーダイン 社からテスト環境サーバへsshを実行$/) do
  run "sudo ip netns exec #{@test_server.name} bash -c 'echo OK | nc -l 22 &'"

  cd('.') do
    @internal_pc.exec "nc #{@test_server.ip_address} 22 > log/nc_22.log"
  end
end

Then(/^ssh成功$/) do
  step %(the file "log/nc_22.log" should contain "OK")
end
