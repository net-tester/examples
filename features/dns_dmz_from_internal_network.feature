@internet @nointernet @static
Feature: DNS で名前解決

  ヨーヨーダイン社の開発者として、
  社内の DNS サーバを経由してインターネット上のサーバの名前解決をしたい
  なぜなら名前解決ができないと、情報検索などで IP アドレスを指定しなければならず不便だから

  Scenario: DNS サーバで名前解決
    Given DNS クライアントとなる開発者 PC
    And ヨーヨーダイン社のDMZ内のDNSサーバ
    When ヨーヨーダイン社のDMZ内のDNSサーバでインターネット上のサーバの名前解決
    Then 名前解決に成功
