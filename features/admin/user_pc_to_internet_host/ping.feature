@static_topology
Feature: 社内からインターネットへアクセス

  ネットワーク管理者として、
  社内からインターネット上のサーバへの通信できるかを確認したい
  なぜなら開発者はインターネット上のサーバにアクセスする必要があるから

  Scenario: 社内の PC からインターネット上のサーバに ping
    Given 社内 PC
    And インターネット上のサーバ
    When 社内 PC にログイン
    And インターネット上のサーバに ping
    Then ping 成功
