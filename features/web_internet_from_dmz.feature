@static
Feature: DMZ のサーバのパッケージアップデート

  ヨーヨーダイン社の管理者として、
  DMZ のサーバのパッケージアップデートを行いたい
  なぜなら機能を最新に保ち、セキュリティも保全できるから

  Scenario: DMZ のサーバのパッケージを http でアップデート
    Given ヨーヨーダイン社の DMZ のサーバ
    And インターネット上のサーバ
    When http でパッケージアップデートを実行
    Then アップデート成功

  Scenario: DMZ のサーバのパッケージを https でアップデート
    Given ヨーヨーダイン社の DMZ のサーバ
    And インターネット上のサーバ
    When https でパッケージアップデートを実行
    Then アップデート成功
