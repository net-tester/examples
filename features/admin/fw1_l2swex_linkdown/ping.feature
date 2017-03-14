@dynamic
Feature: FW1 - L2SWEX 間リンク障害試験
  ヨーヨーダイン社およびタジマックス社社員として
  ヨーヨーダイン社 FW に単発の障害が起きたときでも開発環境にアクセスしたい
  なぜなら開発環境に接続できなくなると業務がストップしてしまうから

  Scenario: リンクダウンの発生後のFailover確認[a]
    Given ヨーヨーダイン社の VPN サーバ
    And タジマックス社の PC
    When ヨーヨーダイン社の VPN サーバにタジマックス社の PC から ping を連続実行
    And FW1 - L2SWEX 間リンク障害発生
    Then ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの ping による疎通が 10 秒以内に復帰
    And FW の主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[a]
    Given ヨーヨーダイン社の VPN サーバ
    And タジマックス社の PC
    When ヨーヨーダイン社の VPN サーバにタジマックス社の PC から ping を連続実行
    And FW1 - L2SWEX 間リンク障害回復
    Then ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの ping による疎通が 10 秒以内に復帰
    And FW の主系が Active 、予備系が Passive になっていること

  Scenario: リンクダウンの発生後のFailover確認[b]
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When DMZ サーバにヨーヨーダイン社内部のユーザ PC から ping を連続実行
    And FW1 - L2SWEX 間リンク障害発生
    Then DMZ のサーバにヨーヨーダイン社内部のユーザ PC からの ping による疎通が 10 秒以内に復帰
    And FW の主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[b]
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When DMZ サーバにヨーヨーダイン社内部のユーザ PC から ping を連続実行
    And FW1 - L2SWEX 間リンク障害回復
    Then DMZ のサーバにヨーヨーダイン社内部のユーザ PC からの ping による疎通が 10 秒以内に復帰
    And FW の主系が Active 、予備系が Passive になっていること

  Scenario: リンクダウンの発生後のFailover確認[c]
    Given ヨーヨーダイン社内部のユーザ PC
    And インターネット上の PC
    When インターネット上の PC にヨーヨーダイン社内部のユーザ PC から ping を連続実行
    And FW1 - L2SWEX 間リンク障害発生
    Then インターネット上の PC にヨーヨーダイン社内部のユーザ PC からの ping による疎通が 10 秒以内に復帰
    And FW の主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[c]
    Given ヨーヨーダイン社内部のユーザ PC
    And インターネット上の PC
    When インターネット上の PC にヨーヨーダイン社内部のユーザ PC から ping を連続実行
    And FW1 - L2SWEX 間リンク障害回復
    Then インターネット上の PC にヨーヨーダイン社内部のユーザ PC からの ping による疎通が 10 秒以内に復帰
    And FW の主系が Active 、予備系が Passive になっていること

