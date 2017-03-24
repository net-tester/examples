@static_topology
Feature: DMZ のサーバから社内へ ping

  ネットワーク管理者として、
  DMZ から社内へつながるか確認をしたい
  なぜなら DMZ のサーバは社内にアクセスする必要があるから

  Scenario: DMZから社内へ ping
    Given DMZ のサーバ
    And 社内 PC
    When DMZ のサーバにログイン
    And 社内 PC に ping
    Then ping 成功
