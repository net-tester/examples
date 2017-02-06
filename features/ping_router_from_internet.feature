@demo
Feature: Internetからヨーヨーダイン社のRouterへの疎通確認

  ヨーヨーダイン社の管理者として、
  Internetからヨーヨーダイン社のRouterへの疎通確認をしたい
  なぜならインターネットからのアクセスはRouterを経由するから

  Scenario: Internetからヨーヨーダイン社のRouterへの疎通確認
    Given Internet上のPC
    When ヨーヨーダイン社のRouterにInternet上のPCからpingで疎通確認
    Then ping で疎通成功
