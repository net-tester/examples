@static_topology
Feature: 社内から DMZ のサーバへ ping

  ネットワーク管理者として、
  社内から DMZ のサーバへつながるか確認をしたい
  なぜなら開発者は DMZ 上のサーバにアクセスする必要があるから

  Scenario: 社内から DMZ のサーバへ ping
    Given 社内 PC
    And DMZ のサーバ
    When 社内 PC にログイン
    And DMZ のサーバに ping
    Then ping 成功
