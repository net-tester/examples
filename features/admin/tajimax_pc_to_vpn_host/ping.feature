@static_topology
Feature: タジマックス社の PC から VPN サーバへアクセス

  ネットワーク管理者として、
  タジマックス社から VPN サーバにアクセスできることを確認したい
  なぜならタジマックス社の開発者は VPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス社の PC から VPN サーバに ping
    Given タジマックス社の PC
    And VPN サーバ
    When タジマックス社の PC にログイン
    And VPN サーバに ping
    Then ping 成功
