@static
Feature: DMZ のサーバのパッケージアップデート

  ネットワーク管理者として、
  DMZ のサーバのパッケージをアップデートしたい
  なぜなら常に最新のパッチを当てたいから

  Scenario: DMZ のサーバのパッケージを http でアップデート
    Given DMZ のサーバ
    And インターネット上のパッケージサーバ
    When DMZ のサーバにログイン
    And http でパッケージアップデートを実行
    Then アップデート成功

  Scenario: DMZ のサーバのパッケージを https でアップデート
    Given DMZ のサーバ
    And インターネット上のパッケージサーバ
    When DMZ のサーバにログイン
    And https でパッケージアップデートを実行
    Then アップデート成功
