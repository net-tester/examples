@static_topology
Feature: インターネットから Router へアクセス

  ネットワーク管理者として、
  インターネットから Router にアクセスできることを確認したい
  なぜならインターネットからのアクセスは Router を経由するから

  Scenario: インターネットから Router に ping
    Given インターネット上の PC
    When インターネット上の PC にログイン
    And Router に ping
    Then ping 成功
