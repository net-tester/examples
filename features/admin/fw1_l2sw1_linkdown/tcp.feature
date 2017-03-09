@dynamic
Feature: FW1-L2SW1間リンク障害試験
  ヨーヨーダイン社およびタジマックス通信工業社社員として
  ヨーヨーダイン社FWに単発の障害が起きたときでも開発環境にアクセスしたい
  なぜなら開発環境に接続できなくなると業務がストップしてしまうから

  Scenario: リンクダウンの発生後のFailover確認[a]
    Given ヨーヨーダイン社の VPN サーバ
    And タジマックス工業の PC
    When ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからTCP接続を開始
    And 10 秒待つ
    And FW1-L2SW1間リンク障害発生
    Then ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのTCP接続が維持されている
    And FWの主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[a]
    Given ヨーヨーダイン社の VPN サーバ
    And タジマックス工業の PC
    When ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからTCP接続を開始
    And 10 秒待つ
    And FW1-L2SW1間リンク障害回復
    Then ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのTCP接続が維持されている
    And FWの主系が Active 、予備系が Passive になっていること

  Scenario: リンクダウンの発生後のFailover確認[b]
    Given ヨーヨーダイン社の DMZ の VPN アドレスプール
    And ヨーヨーダイン社内部の資産管理サーバ
    When ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社のDMZ内部のVPNアドレスプールからTCP接続を開始
    And 10 秒待つ
    And FW1-L2SW1間リンク障害発生
    Then ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社のDMZ内部のVPNアドレスプールからTCP接続が維持されている
    And FWの主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[b]
    Given ヨーヨーダイン社の DMZ の VPN アドレスプール
    And ヨーヨーダイン社内部の資産管理サーバ
    When ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社のDMZ内部のVPNアドレスプールからTCP接続を開始
    And 10 秒待つ
    And FW1-L2SW1間リンク障害回復
    Then ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社のDMZ内部のVPNアドレスプールからTCP接続が維持されている
    And FWの主系が Active 、予備系が Passive になっていること
