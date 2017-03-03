@static
Feature: インターネットからヨーヨーダイン社のRouterへの疎通確認

  ヨーヨーダイン社の管理者として、
  インターネットからヨーヨーダイン社のFirewallへの疎通確認をしたい
  なぜならインターネットからのアクセスはFirewallを経由するから

  Scenario: インターネットからヨーヨーダイン社のFirewallへの疎通確認
    Given インターネット上の PC
    When インターネット上の PC にログイン 
    And Firewall に ping
    Then ping 成功
