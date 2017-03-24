@static_topology
Feature: 社内テスト環境サーバの Web コンソールにアクセス

  開発者として、
  社内テスト環境サーバの Web コンソールにアクセスしたい
  なぜならテスト環境でのテスト実施や確認をするから

  Scenario: 社内テスト環境サーバ Web コンソールへアクセス
    Given 社内 PC
    And 社内のテスト環境サーバ
    When 社内 PC にログイン
    And Web ブラウザで社内のテスト環境サーバの Web コンソールにアクセス
    Then アクセス成功
