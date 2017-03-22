@static
Feature: 社内テスト環境サーバ設定

  開発者として、
  社内テスト環境サーバに telnet でログインしたい
  なぜならテスト環境設定を行う必要があるから

  Scenario: 社内テスト環境サーバへ telnet でログイン
    Given 社内 PC
    And 社内のテスト環境サーバ
    When 社内 PC にログイン
    And 社内のテスト環境サーバに telnet でログイン
    Then ログイン成功
