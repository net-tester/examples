@static
Feature: DMZ の VPN アドレスプールから社内の資産管理サーバへ git

  ネットワーク管理者として、
  DMZ の VPN アドレスプールから社内の資産管理サーバへ git でアクセスさせたい
  なぜなら開発業務でタジマックス社の開発者が Git サービスにアクセスするから

  Scenario: DMZ の VPN アドレスプールから社内の資産管理サーバへ git
    Given DMZ の VPN アドレスプール
    And 社内の資産管理サーバ
    When DMZ の VPN アドレスプールにログイン
    And 資産管理サーバへ git
    Then アクセス成功
