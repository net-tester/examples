@demo
Feature: Internetからヨーヨーダイン社のRouterへの疎通確認

  ヨーヨーダイン社の管理者として、
  Internetからヨーヨーダイン社のFirewallへの疎通確認をしたい
  なぜならインターネットからのアクセスはFirewallを経由するから

  Scenario: Internetからヨーヨーダイン社のFirewallへの疎通確認
    Given Internet上のPC
    When FirewallにInternet上のPCからpingで疎通確認
    Then pingで疎通成功
