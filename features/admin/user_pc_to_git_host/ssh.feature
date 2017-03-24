@static_topology
Feature: 社内から資産管理サーバに ssh でログイン

  ネットワーク管理者として、
  社内から資産管理サーバに ssh でログインしたい
  なぜならメンテナンス業務に必要だから

  Scenario: 社内から資産管理サーバに ssh でログイン
    Given 社内 PC
    And 社内の資産管理サーバ
    When 社内 PC にログイン
    And 社内の資産管理サーバに ssh でログイン
    Then ログイン成功
