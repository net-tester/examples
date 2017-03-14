@dynamic
Feature: FW1 - L2SWEX 間リンク障害試験
  ヨーヨーダイン社およびタジマックス社社員として
  ヨーヨーダイン社 FW に単発の障害が起きたときでも開発環境にアクセスしたい
  なぜなら開発環境に接続できなくなると業務がストップしてしまうから

  Scenario: リンクダウンの発生後のFailover確認[a]
    Given ヨーヨーダイン社の VPN サーバ
    And タジマックス社の PC
    When ヨーヨーダイン社の VPN サーバにタジマックス社の PC から TCP 接続を開始
    And 10 秒待つ
    And FW1 - L2SWEX 間リンク障害発生
    Then ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの TCP 接続が維持されている
    And FW の主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[a]
    Given ヨーヨーダイン社の VPN サーバ
    And タジマックス社の PC
    When ヨーヨーダイン社の VPN サーバにタジマックス社の PC から TCP 接続を開始
    And 10 秒待つ
    And FW1 - L2SWEX 間リンク障害回復
    Then ヨーヨーダイン社の VPN サーバにタジマックス社の PC からの TCP 接続が維持されている
    And FW の主系が Active 、予備系が Passive になっていること

  Scenario: リンクダウンの発生後のFailover確認[b]
    Given ヨーヨーダイン社の DMZ の VPN アドレスプール
    And ヨーヨーダイン社内部の資産管理サーバ
    When ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社の DMZ の VPN アドレスプールから TCP 接続を開始
    And 10 秒待つ
    And FW1 - L2SWEX 間リンク障害発生
    Then ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社の DMZ の VPN アドレスプールから TCP 接続が維持されている
    And FW の主系が Passive 、予備系が Active になっていること

  Scenario: リンクダウンの発生後のFailback確認[b]
    Given ヨーヨーダイン社の DMZ の VPN アドレスプール
    And ヨーヨーダイン社内部の資産管理サーバ
    When ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社の DMZ の VPN アドレスプールから TCP 接続を開始
    And 10 秒待つ
    And FW1 - L2SWEX 間リンク障害回復
    Then ヨーヨーダイン社内部の資産管理サーバにヨーヨーダイン社の DMZ の VPN アドレスプールから TCP 接続が維持されている
    And FW の主系が Active 、予備系が Passive になっていること
