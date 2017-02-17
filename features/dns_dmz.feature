Feature: DNS で名前解決

  ヨーヨーダイン社の管理者として、
  DMSのサーバから社内の DNS サーバを経由してインターネット上のサーバの名前解決をしたい
  なぜなら名前解決ができないと、メンテナンスなどで IP アドレスを指定しなければならず不便だから

  Scenario: DNS サーバで名前解決
    Given ヨーヨーダイン社の DMZ のサーバ
    And ヨーヨーダイン社の DMZ の DNS サーバ
    When インターネット上のサーバの名前解決
    Then 名前解決に成功
