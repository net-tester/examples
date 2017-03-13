@static
Feature: タジマックス社の PC から VPN サーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  タジマックス社から VPN サーバへの疎通確認をしたい
  なぜならタジマックス社の開発者は VPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス社の PC から VPN サーバに疎通確認
    Given タジマックス社の PC
    And ヨーヨーダイン社の VPN サーバ
    When タジマックス社の PC にログイン
    And ヨーヨーダイン社の VPN サーバに ping
    Then ping 成功
