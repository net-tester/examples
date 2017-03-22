@dynamic
Feature: FW1 - L2SWEX 間リンク障害試験
  ヨーヨーダイン社およびタジマックス社社員として
  ヨーヨーダイン社 FW に単発の障害が起きたときでも a, b の経路を通じて開発環境にアクセスしたい
  なぜなら開発環境に接続できなくなると業務がストップしてしまうから

  Scenario: リンクダウンの発生後の Failover 確認[a]
    Given VPN サーバ
    And タジマックス社の PC
    When タジマックス社の PC から VPN サーバに TCP で接続
    And 10 秒待つ
    And FW1 - L2SWEX 間リンク障害発生
    Then タジマックス社の PC から VPN サーバへの TCP 接続が切れていない
    And FW の主系が Passive 、予備系が Active になっている

  Scenario: リンクダウンの発生後のFailback確認[a]
    Given VPN サーバ
    And タジマックス社の PC
    When タジマックス社の PC から VPN サーバに TCP で接続
    And 10 秒待つ
    And FW1 - L2SWEX 間リンク障害回復
    Then タジマックス社の PC から VPN サーバへの TCP 接続が切れていない
    And FW の主系が Active 、予備系が Passive になっている

  Scenario: リンクダウンの発生後の Failover 確認[b]
    Given DMZ の VPN アドレスプール
    And 社内の資産管理サーバ
    When 社内の資産管理サーバに DMZ の VPN アドレスプールから TCP で接続
    And 10 秒待つ
    And FW1 - L2SWEX 間リンク障害発生
    Then DMZ の VPN アドレスプールから社内の資産管理サーバへの TCP 接続が切れていない
    And FW の主系が Passive 、予備系が Active になっている

  Scenario: リンクダウンの発生後のFailback確認[b]
    Given DMZ の VPN アドレスプール
    And 社内の資産管理サーバ
    When 社内の資産管理サーバに DMZ の VPN アドレスプールから TCP で接続
    And 10 秒待つ
    And FW1 - L2SWEX 間リンク障害回復
    Then DMZ の VPN アドレスプールから社内の資産管理サーバへの TCP 接続が切れていない
    And FW の主系が Active 、予備系が Passive になっている
