@static
Feature: 社内 PC から VPN サーバにログイン

  ネットワーク管理者として、
  社内 PC から VPN サーバに ssh コマンドや Web ブラウザ経由でログインしたい
  なぜなら VPN サーバをメンテナンスするから

  Scenario: 社内の PC から VPN サーバに ssh でログイン
    Given 社内 PC
    And VPN サーバ
    When 社内 PC にログイン
    And VPN サーバに ssh でログイン
    Then ログイン成功

  Scenario: 社内の PC から VPN サーバに http でログイン
    Given 社内 PC
    And VPN サーバ
    When 社内 PC にログイン
    And VPN サーバに Web ブラウザから http でログイン
    Then ログイン成功

  Scenario: 社内の PC から VPN サーバに https でログイン
    Given 社内 PC
    And VPN サーバ
    When 社内 PC にログイン
    And VPN サーバに Web ブラウザから https でログイン
    Then ログイン成功
