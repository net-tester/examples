@static
Feature: DMZ のサーバのパッケージアップデート

  ネットワーク管理者として、
  DMZ のサーバのパッケージアップデートを行いたい
  なぜなら機能を最新に保ち、セキュリティも保全できるから

  Scenario: DMZ のサーバのパッケージを http でアップデート
    Given DMZ のサーバ
    And インターネット上のサーバ
    When DMZ のサーバにログイン
    And http でインターネット上のサーバからパッケージアップデートを実行
    Then アップデート成功

  Scenario: DMZ のサーバのパッケージを https でアップデート
    Given DMZ のサーバ
    And インターネット上のサーバ
    When DMZ のサーバにログイン
    And https でインターネット上のサーバからパッケージアップデートを実行
    Then アップデート成功
