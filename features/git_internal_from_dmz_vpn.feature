Feature: DMZ の VPN アドレスプールからヨーヨーダイン社内部の資産管理サーバへ git

  ヨーヨーダイン社の管理者として、
  DMZ の VPN アドレスプールからヨーヨーダイン社内部の資産管理サーバへ git でアクセスさせたい
  なぜなら開発業務でタジマック社の開発者が Git サービスにアクセスするから

  Scenario: DMZ の VPN アドレスプールからヨーヨーダイン社内部の資産管理サーバへ git
    Given ヨーヨーダイン社内部の資産管理サーバ
    And ヨーヨーダイン社の DMZ の VPN アドレスプール
    When 資産管理サーバへ git
    Then アクセス成功