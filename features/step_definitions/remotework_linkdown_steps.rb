# coding: utf-8
Given(/^ヨーヨーダイン社のサーバに VPN 経由でリモートアクセスして作業$/) do
  step %(タジマックス社の PC から VPN サーバに ping を連続実行)
  step %(タジマックス社の PC から VPN サーバに TCP で接続)
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
  step %(タジマックス社の PC から VPN サーバへの ping が 10 秒以内に復帰)
  step %(タジマックス社の PC から VPN サーバへの TCP 接続が切れていない)
  step %(FW の主系が Passive 、予備系が Active になっている)
end

Then(/^リモート接続に影響がない$/) do
  step %(タジマックス社の PC から VPN サーバへの ping が 10 秒以内に復帰)
  step %(タジマックス社の PC から VPN サーバへの TCP 接続が切れていない)
  step %(FW の主系が Active 、予備系が Passive になっている)
end
