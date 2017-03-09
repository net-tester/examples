@static
Feature: 社内 Git サービス

  ヨーヨーダイン社の開発者として、
  社内 Git サーバにアクセスしたい
  なぜならソースコードを社内 Git サーバで管理しているから

  Scenario: 社内 Git サービスへアクセス
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社内部の資産管理サーバ
    When ヨーヨーダイン社内部のユーザ PC にログイン
    And 資産管理サーバへ git
    Then アクセス成功