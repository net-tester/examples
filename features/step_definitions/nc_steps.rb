When(/^ヨーヨーダイン 社からテスト環境サーバへsshを実行$/) do
  Thread.start {@test_server.exec "bash -c 'echo OK | nc -l 22'"}
  sleep(3)
  cd('.') do
    @internal_pc.exec "nc #{@test_server.ip_address} 22 > log/nc_22.log"
  end
end

Then(/^ssh成功$/) do
  step %(the file "log/nc_22.log" should contain "OK")
end
