@static_topology
Feature: 社内の PC から DMZ のサーバにログイン

  ネットワーク管理者として、
  社内の PC から DMZ のサーバに ssh コマンドや Web ブラウザ経由でログインしたい
  なぜなら VPN サーバをメンテナンスするから

  Scenario: 社内の PC から DMZ のサーバに ssh でログイン
    Given 社内 PC
    And DMZ のサーバ
    When 社内 PC にログイン
    And DMZ のサーバに ssh でログイン
    Then ログイン成功

  Scenario: 社内の PC から DMZ のサーバに http でログイン
    Given 社内 PC
    And DMZ のサーバ
    When 社内 PC にログイン
    And DMZ のサーバに Web ブラウザから http でログイン
    Then ログイン成功

  Scenario: 社内の PC から DMZ のサーバに https でログイン
    Given 社内 PC
    And DMZ のサーバ
    When 社内 PC にログイン
    And DMZ のサーバに Web ブラウザから https でログイン
    Then ログイン成功
