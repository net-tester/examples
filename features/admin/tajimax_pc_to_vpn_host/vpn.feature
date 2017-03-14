@static
Feature: タジマックス社の PC からヨーヨーダイン社の VPN サーバにログイン

  ヨーヨーダイン社の管理者として、
  タジマックス社の PC からヨーヨーダイン社の VPN サーバにログインしたい
  なぜならタジマックス社の開発者は VPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス社の PC からヨーヨーダイン社の VPN サーバに http でログイン
    Given タジマックス社の PC
    And ヨーヨーダイン社の VPN サーバ
    When タジマックス社の PC にログイン
    And ヨーヨーダイン社の VPN サーバに Firewall 経由で http でログイン
    Then ログイン成功

  Scenario: タジマックス社の PC からヨーヨーダイン社の VPN サーバに https でログイン
    Given タジマックス社の PC
    And ヨーヨーダイン社の VPN サーバ
    When タジマックス社の PC にログイン
    And ヨーヨーダイン社の VPN サーバに Firewall 経由で https でログイン
    Then ログイン成功

