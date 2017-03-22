@static
Feature: DNS で名前解決

  ネットワーク管理者として、
  社内の DNS サーバから上位 DNS サーバへ問い合わせたい
  なぜなら、毎回 IP アドレスを指定するのは不便だから

  Scenario: DNS サーバで名前解決
    Given DMZ の DNS サーバ
    And インターネット上の DNS サーバ
    When DMZ の DNS サーバにログイン
    And インターネット上の DNS サーバに dig コマンドで "www.google.com" の IP アドレスを問い合わせる
    Then 名前解決に成功
