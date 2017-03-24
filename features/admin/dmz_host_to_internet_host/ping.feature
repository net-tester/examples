@static_topology
Feature: DMZ から インターネット上のサーバへの ping

  ネットワーク管理者として、
  DMZ からインターネット上のサーバにつながるか確認したい
  なぜなら DMZ のサーバはインターネット上のサーバにアクセスする必要があるから

  Scenario: DMZ からインターネット上のサーバへの ping
    Given DMZ のサーバ
    And インターネット上のサーバ
    When DMZ のサーバにログイン
    And インターネット上のサーバに ping
    Then ping 成功
