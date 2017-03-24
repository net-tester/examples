@static_topology
Feature: DNS で名前解決

  ネットワーク管理者として、
  DMZ のサーバから社内の DNS サーバを使ってインターネット上のサーバの名前解決をしたい
  なぜなら、毎回 IP アドレスを指定するのは不便だから

  Scenario: DNS で名前解決
    Given DMZ の DNS サーバ
    And DMZ のサーバ
    When DMZ のサーバにログイン
    And DMZ の DNS サーバに dig コマンドで "www.google.com" の IP アドレスを問い合わせる
    Then 名前解決に成功
