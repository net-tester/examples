Then(/^アクセス成功$/) do
  result = @src_host.result(@process_id)
  expect(result).to match(/AccessOK/)
end

Then(/^ログイン成功$/) do
  step %(アクセス成功)
end

Then(/^アップデート成功$/) do
  step %(アクセス成功)
end

Then(/^時刻の同期に成功$/) do
  result = @src_host.result(@process_id)
  expect(result).to match(/adjust time server/)
end

Then(/^ping 成功$/) do
  result = @src_host.result(@process_id)
  expect(result).to match(/4 received, 0% packet loss/)
end

Then(/^Google のトップページが表示$/) do
  result = @src_host.result(@process_id)
  expect(result).to match(/<title>Google<\/title>/)
end

Then(/^名前解決に成功$/) do
  result = @src_host.result(@process_id)
  expect(result).to match(/172.217.25.196/)
end
