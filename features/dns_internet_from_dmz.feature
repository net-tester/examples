@internet @nointernet @static
Feature: DNS で名前解決

  ヨーヨーダイン社の管理者として、
  社内の DNS サーバから上位 DNS サーバへの問い合わせを行わせたい
  なぜなら名前解決ができないと、情報検索などで IP アドレスを指定しなければならず不便だから

  Scenario: DNS サーバで名前解決
    Given ヨーヨーダイン社のDMZ内のDNSサーバ
    And インターネット上の DNS サーバ
    When インターネット上のDNSサーバでインターネット上のサーバの名前解決
    Then 名前解決に成功
