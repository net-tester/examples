@static
Feature: DNS で名前解決

  開発者として、
  社内の DNS サーバを経由してインターネット上のサーバの名前解決をしたい
  なぜなら名前解決ができないと、情報検索などで IP アドレスを指定しなければならず不便だから

  Scenario: DNS サーバで名前解決
    Given 社内 PC
    And DMZ の DNS サーバ
    When 社内 PC にログイン
    And DMZ の DNS サーバに dig コマンドで "www.google.com" の IP アドレスを問い合わせる
    Then 名前解決に成功
