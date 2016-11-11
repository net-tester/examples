Feature: FW1-L2SWEX間リンク障害試験
  ヨーヨーダイン社およびタジマックス通信工業社社員として
  ヨーヨーダイン社FWに単発の障害が起きたときでも開発環境にアクセスしたい
  なぜなら開発環境に接続できなくなると業務がストップしてしまうから

  Scenario: リンクダウンの発生後のFailover確認[a]
    Given ヨーヨーダイン社のDMZ内部のVPNサーバ
    And タジマックス工業のPC
    When ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからpingを連続実行
    And FW1-L2SWEX間リンク障害発生
    Then ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[a]
    Given ヨーヨーダイン社のDMZ内部のVPNサーバ
    And タジマックス工業のPC
    When ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからpingを連続実行
    And FW1-L2SWEX間リンク障害回復
    Then ヨーヨーダイン社のDMZ内部のVPNサーバにタジマックス工業のPCからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Active 、予備系が Passive になっていること

  Scenario: リンクダウンの発生後のFailover確認[b]
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のサーバ
    When DMZ内部のサーバにヨーヨーダイン社内部のクライアントからpingを連続実行
    And FW1-L2SWEX間リンク障害発生
    Then DMZ内部のサーバにヨーヨーダイン社内部のクライアントからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[b]
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のサーバ
    When DMZ内部のサーバにヨーヨーダイン社内部のクライアントからpingを連続実行
    And FW1-L2SWEX間リンク障害回復
    Then DMZ内部のサーバにヨーヨーダイン社内部のクライアントからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Active 、予備系が Passive になっていること

  Scenario: リンクダウンの発生後のFailover確認[c]
    Given ヨーヨーダイン社内部のクライアント
    And Internet上のPC
    When Internet上のPCにヨーヨーダイン社内部のクライアントからpingを連続実行
    And FW1-L2SWEX間リンク障害発生
    Then Internet上のPCにヨーヨーダイン社内部のクライアントからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[c]
    Given ヨーヨーダイン社内部のクライアント
    And Internet上のPC
    When Internet上のPCにヨーヨーダイン社内部のクライアントからpingを連続実行
    And FW1-L2SWEX間リンク障害回復
    Then Internet上のPCにヨーヨーダイン社内部のクライアントからのpingによる疎通が 10 秒以内に復帰
    And FWの主系が Active 、予備系が Passive になっていること

