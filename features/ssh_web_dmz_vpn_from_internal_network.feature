@static
Feature: ヨーヨーダイン社内部から VPN サーバにログイン

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部から VPN サーバに ssh コマンドや Web ブラウザ経由でログインしたい
  なぜなら VPN サーバをメンテナンスするから

  Scenario: ヨーヨーダイン社内部の PC から VPN サーバに ssh でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の VPN サーバ
    When VPN サーバに ssh でログイン
    Then ログイン成功

  Scenario: ヨーヨーダイン社内部の PC から VPN サーバに http でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の VPN サーバ
    When VPN サーバ に Web ブラウザから http でログイン
    Then ログイン成功

  Scenario: ヨーヨーダイン社内部の PC から VPN サーバに https でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の VPN サーバ
    When VPN サーバ に Web ブラウザから https でログイン
    Then ログイン成功
