@static
Feature: ヨーヨーダイン社内部から DMZ のサーバにログイン

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部から DMZ のサーバに ssh コマンドや Web ブラウザ経由でログインしたい
  なぜなら VPN サーバをメンテナンスするから

  Scenario: ヨーヨーダイン社内部の PC から DMZ のサーバに ssh でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When DMZ のサーバに ssh でログイン
    Then ログイン成功

  Scenario: ヨーヨーダイン社内部の PC から DMZ のサーバに http でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When DMZ のサーバ に Web ブラウザから http でログイン
    Then ログイン成功

  Scenario: ヨーヨーダイン社内部の PC から DMZ のサーバに https でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When DMZ のサーバ に Web ブラウザから https でログイン
    Then ログイン成功
