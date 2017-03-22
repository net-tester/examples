@static
Feature: インターネットから VPN サーバへ ping

  ネットワーク管理者として、
  インターネットから VPN サーバにつながるか確認したい
  なぜならタジマックス社の開発者はインターネットから VPN サーバを経由して開発環境にアクセスするから

  Scenario: インターネットから VPN サーバへ ping
    Given インターネット上の PC
    And VPN サーバ
    When インターネット上の PC にログイン
    And VPN サーバに ping
    Then ping 成功
