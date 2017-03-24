@static_topology
Feature: 社内の PC から DMZ の DNS サーバに ssh でログイン

  ネットワーク管理者として、
  社内の PC から DMZ の DNS サーバに ssh でログインしたい
  なぜなら DNS サーバをメンテナンスするから

  Scenario: 社内の PC から DMZ の DNS サーバに ssh
    Given 社内 PC
    And DMZ の DNS サーバ
    When 社内 PC にログイン
    And DMZ の DNS サーバに ssh でログイン
    Then ログイン成功
