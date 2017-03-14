# coding: utf-8
Given(/^ヨーヨーダイン社のサーバに VPN 経由でリモートアクセスして作業$/) do
  step %(ヨーヨーダイン社の VPN サーバにタジマックス社の PC から ping を連続実行)
  step %(ヨーヨーダイン社の VPN サーバにタジマックス社の PC から TCP 接続を開始)
end

When(/^(\w+) と (\w+) 間にリンク障害が発生$/) do |src, dst|
  step %(10 秒待つ)
  step %(#{src} - #{dst} 間リンク障害発生)
end

When(/^(\w+) と (\w+) 間のリンク障害が回復$/) do |src, dst|
  step %(10 秒待つ)
  step %(#{src} - #{dst} 間リンク障害回復)
end

Then(/^リモート接続が切れていない$/) do
  step %(ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの ping による疎通が 10 秒以内に復帰)
  step %(ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの TCP 接続が維持されている)
  step %(FW の主系が Passive 、予備系が Active になっていること)
end

Then(/^リモート接続に影響がない$/) do
  step %(ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの ping による疎通が 10 秒以内に復帰)
  step %(ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの TCP 接続が維持されている)
  step %(FW の主系が Active 、予備系が Passive になっていること)
end
