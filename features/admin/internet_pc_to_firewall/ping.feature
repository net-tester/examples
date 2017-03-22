@static
Feature: インターネットから Firewall へアクセス

  ネットワーク管理者として、
  インターネットから Firewall にアクセスできることを確認したい
  なぜならインターネットからのアクセスは Firewall を経由するから

  Scenario: インターネットから Firewall に ping
    Given インターネット上の PC
    When インターネット上の PC にログイン
    And Firewall に ping
    Then ping 成功
