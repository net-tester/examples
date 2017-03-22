@static
Feature: 社内 PC から DNS サーバへアクセス

  ネットワーク管理者として、
  社内の PC から DNS へつながるかを確認したい
  なぜなら開発者はインターネットにアクセスするために DNS サーバにアクセスする必要があるから

  Scenario: 社内の PC から DNS サーバに ping
    Given 社内 PC
    And DMZ の DNS サーバ
    When 社内 PC にログイン
    And DMZ の DNS サーバに ping
    Then ping 成功
