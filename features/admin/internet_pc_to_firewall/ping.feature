@static
Feature: インターネットからヨーヨーダイン社の Firewall への疎通確認

  ヨーヨーダイン社の管理者として、
  インターネットからヨーヨーダイン社の Firewall への疎通確認をしたい
  なぜならインターネットからのアクセスは Firewall を経由するから

  Scenario: インターネットからヨーヨーダイン社の Firewall への疎通確認
    Given インターネット上の PC
    When インターネット上の PC にログイン 
    And Firewall に ping
    Then ping 成功
