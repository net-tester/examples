@static
Feature: DMZ から インターネット上のサーバへの ping

  ヨーヨーダイン社の管理者として、
  DMZ からインターネット上のサーバにつながるか確認したい
  なぜなら DMZ のサーバはインターネット上のサーバにアクセスする必要があるから

  Scenario: DMZ からインターネット上のサーバへの ping
    Given ヨーヨーダイン社の DMZ のサーバ
    And インターネット上のサーバ
    When ヨーヨーダイン社の DMZ のサーバにログイン
    And インターネット上のサーバに ping
    Then ping 成功
