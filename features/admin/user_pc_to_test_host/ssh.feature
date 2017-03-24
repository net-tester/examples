@static_topology
Feature: 社内からテスト環境サーバに ssh でログイン

  ネットワーク管理者として、
  社内からテスト環境サーバへ ssh でログインしたい
  なぜならメンテナンス業務に必要だから

  Scenario: 社内からテスト環境サーバへ ssh
    Given 社内 PC
    And 社内のテスト環境サーバ
    When 社内 PC にログイン
    When 社内のテスト環境サーバに ssh でログイン
    Then ログイン成功
