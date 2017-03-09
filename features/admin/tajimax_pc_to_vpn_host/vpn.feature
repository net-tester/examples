@static
Feature: タジマックス工業の PC からヨーヨーダイン社の VPN サーバにログイン

  ヨーヨーダイン社の管理者として、
  タジマックス工業の PC からヨーヨーダイン社の VPN サーバにログインしたい
  なぜならタジマックス工業の開発者は VPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス工業の PC からヨーヨーダイン社の VPN サーバに http でログイン
    Given タジマックス工業の PC
    And ヨーヨーダイン社の VPN サーバ
    When タジマックス工業の PC にログイン
    And ヨーヨーダイン社の VPN サーバに Firewall 経由で http でログイン
    Then ログイン成功

  Scenario: タジマックス工業の PC からヨーヨーダイン社の VPN サーバに https でログイン
    Given タジマックス工業の PC
    And ヨーヨーダイン社の VPN サーバ
    When タジマックス工業の PC にログイン
    And ヨーヨーダイン社の VPN サーバに Firewall 経由で https でログイン
    Then ログイン成功

