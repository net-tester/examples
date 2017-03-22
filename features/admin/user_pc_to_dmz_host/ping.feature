@static
Feature: 社内からDMZ のサーバへ ping

  ネットワーク管理者として、
  社内からDMZ のサーバへつながるか確認をしたい
  なぜなら開発者は DMZ 上のサーバにアクセスする必要があるから

  Scenario: 社内から DMZ への疎通確認
    Given 社内 PC
    And DMZ のサーバ
    When 社内 PC にログイン
    And DMZ のサーバに ping
    Then ping 成功
