Given(/^ヨーヨーダイン社のサーバにVPN経由でリモートアクセスして作業$/) do
  step %(ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからpingを連続実行)
  step %(ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからTCP接続を開始)
end

When(/^“FW1” と “L2SW1” 間にリンク障害が発生$/) do
  step %(10 秒待つ)
  step %(FW1-L2SW1間リンク障害発生)
end

When(/^“FW1” と “L2SW1” 間のリンク障害が回復$/) do
  step %(10 秒待つ)
  step %(FW1-L2SW1間リンク障害回復)
end

Then(/^リモート接続が切れていない$/) do
  step %(ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのpingによる疎通が 10 秒以内に復帰)
  step %(ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのTCP接続が維持されている)
  step %(FWの主系が Passive 、予備系が Active になっていること)
end

Then(/^リモート接続に影響がない$/) do
  step %(ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのpingによる疎通が 10 秒以内に復帰)
  step %(ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのTCP接続が維持されている)
  step %(FWの主系が Active 、予備系が Passive になっていること)
end
