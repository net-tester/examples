@static
Feature: 社内 Git サービス

  開発者として、
  社内 Git サーバにアクセスしたい
  なぜならソースコードを社内 Git サーバで管理しているから

  Scenario: 社内 Git サービスへアクセス
    Given 社内 PC
    And 社内の資産管理サーバ
    When 社内 PC にログイン
    And 資産管理サーバへ git
    Then アクセス成功
