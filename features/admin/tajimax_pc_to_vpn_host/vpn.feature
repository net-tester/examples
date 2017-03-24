@static_topology
Feature: タジマックス社の PC から VPN サーバにログイン

  ネットワーク管理者として、
  タジマックス社の PC からVPN サーバにログインしたい
  なぜならタジマックス社の開発者は VPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス社の PC から VPN サーバに http でログイン
    Given タジマックス社の PC
    And VPN サーバ
    When タジマックス社の PC にログイン
    And VPN サーバに Firewall 経由で http でログイン
    Then ログイン成功

  Scenario: タジマックス社の PC から VPN サーバに https でログイン
    Given タジマックス社の PC
    And VPN サーバ
    When タジマックス社の PC にログイン
    And VPN サーバに Firewall 経由で https でログイン
    Then ログイン成功

