@static
Feature: タジマックス工業の PC から VPN サーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  タジマックス工業から VPN サーバへの疎通確認をしたい
  なぜならタジマックス工業の開発者は VPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス工業の PC から VPN サーバに疎通確認
    Given タジマックス工業の PC
    And ヨーヨーダイン社の VPN サーバ
    When タジマックス工業の PC にログイン
    And ヨーヨーダイン社の VPN サーバに ping
    Then ping 成功
