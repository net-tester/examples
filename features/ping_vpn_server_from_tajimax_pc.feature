@internet @nointernet @static
Feature: タジマックス工業の PC から VPN サーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  タジマックス工業から VPN サーバへの疎通確認をしたい
  なぜならタジマックス工業の開発者は VPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス工業の PC から VPN サーバに疎通確認
    Given タジマックス工業の PC
    And ヨーヨーダイン社の VPN サーバ
    When VPN サーバにタジマックス工業の PC から ping で疎通確認
    Then ping で疎通成功
