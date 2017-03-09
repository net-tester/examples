@static
Feature: ヨーヨーダイン社内部から DMZ のサーバにログイン

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部から DMZ のサーバに ssh コマンドや Web ブラウザ経由でログインしたい
  なぜなら VPN サーバをメンテナンスするから

  Scenario: ヨーヨーダイン社内部の PC から DMZ のサーバに ssh でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When ヨーヨーダイン社内部のユーザ PC にログイン
    And ヨーヨーダイン社の DMZ のサーバに ssh でログイン
    Then ログイン成功

  Scenario: ヨーヨーダイン社内部の PC から DMZ のサーバに http でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When ヨーヨーダイン社内部のユーザ PC にログイン
    And ヨーヨーダイン社の DMZ のサーバに Web ブラウザから http でログイン
    Then ログイン成功

  Scenario: ヨーヨーダイン社内部の PC から DMZ のサーバに https でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When ヨーヨーダイン社内部のユーザ PC にログイン
    And ヨーヨーダイン社の DMZ のサーバに Web ブラウザから https でログイン
    Then ログイン成功
