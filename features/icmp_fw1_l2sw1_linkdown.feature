@dynamic
Feature: FW1-L2SW1間リンク障害試験
  ヨーヨーダイン社およびタジマックス通信工業社社員として
  ヨーヨーダイン社FWに単発の障害が起きたときでも開発環境にアクセスしたい
  なぜなら開発環境に接続できなくなると業務がストップしてしまうから

  Scenario: リンクダウンの発生後のFailover確認[a]
    Given ヨーヨーダイン社の VPN サーバ
    And タジマックス工業の PC
    When ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからpingを連続実行
    And 10 秒待つ
    And FW1-L2SW1間リンク障害発生
    Then ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[a]
    Given ヨーヨーダイン社の VPN サーバ
    And タジマックス工業の PC
    When ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからpingを連続実行
    And 10 秒待つ
    And FW1-L2SW1間リンク障害回復
    Then ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Active 、予備系が Passive になっていること

  Scenario: リンクダウンの発生後のFailover確認[b]
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社の DMZ のサーバ
    When DMZ内部のサーバにヨーヨーダイン社内部のクライアントからpingを連続実行
    And 10 秒待つ
    And FW1-L2SW1間リンク障害発生
    Then DMZ内部のサーバにヨーヨーダイン社内部のクライアントからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[b]
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社の DMZ のサーバ
    When DMZ内部のサーバにヨーヨーダイン社内部のクライアントからpingを連続実行
    And 10 秒待つ
    And FW1-L2SW1間リンク障害回復
    Then DMZ内部のサーバにヨーヨーダイン社内部のクライアントからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Active 、予備系が Passive になっていること

  Scenario: リンクダウンの発生後のFailover確認[c]
    Given ヨーヨーダイン社内部のクライアント
    And インターネット上の PC
    When インターネット上の PC にヨーヨーダイン社内部のクライアントから ping を連続実行
    And 10 秒待つ
    And FW1-L2SW1間リンク障害発生
    Then インターネット上の PC にヨーヨーダイン社内部のクライアントからの ping による疎通が 10 秒以内に復帰
    And FWの主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[c]
    Given ヨーヨーダイン社内部のクライアント
    And インターネット上の PC
    When インターネット上の PC にヨーヨーダイン社内部のクライアントから ping を連続実行
    And 10 秒待つ
    And FW1-L2SW1間リンク障害回復
    Then インターネット上の PC にヨーヨーダイン社内部のクライアントからの ping による疎通が 10 秒以内に復帰
    And FWの主系が Active 、予備系が Passive になっていること

