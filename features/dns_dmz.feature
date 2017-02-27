@static
Feature: DNS で名前解決

  ヨーヨーダイン社の管理者として、
  DMZ のサーバから社内の DNS サーバを使ってインターネット上のサーバの名前解決をしたい
  なぜなら名前解決ができないと、メンテナンスなどで IP アドレスを指定しなければならず不便だから

  Scenario: DNS サーバで名前解決
    Given ヨーヨーダイン社の DMZ のサーバ
    And ヨーヨーダイン社の DMZ の DNS サーバ
    When dig コマンドで "www.google.com" の IP アドレスを調べる
    Then 名前解決に成功
