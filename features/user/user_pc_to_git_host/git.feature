@static_topology
Feature: 社内 Git サービス

  開発者として、
  社内の資産管理サーバにある Git サービスにアクセスしたい
  なぜならソースコードを git で管理しているから

  Scenario: 社内 Git サービスへアクセス
    Given 社内 PC
    And 社内の資産管理サーバ
    When 社内 PC にログイン
    And 資産管理サーバへ git
    Then アクセス成功
