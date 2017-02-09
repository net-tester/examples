@demo
Feature: インターネットからヨーヨーダイン社のRouterへの疎通確認

  ヨーヨーダイン社の管理者として、
  インターネットからヨーヨーダイン社のRouterへの疎通確認をしたい
  なぜならインターネットからのアクセスはRouterを経由するから

  Scenario: インターネットからヨーヨーダイン社のRouterへの疎通確認
    Given インターネット上の PC
    When ヨーヨーダイン社の Router にインターネット上の PC から ping
    Then ping 成功
