@static_topology
Feature: NTP で時刻を同期

  ネットワーク管理者として、
  インターネット上の NTP サーバを使って DMZ のサーバの時刻を同期したい
  なぜなら時刻がばらばらだと運用で困るから

  Scenario: NTP サーバと時刻を同期 (UDP)
    Given DMZ のサーバ
    And インターネット上の NTP サーバ
    When DMZ のサーバにログイン
    And 時刻をインターネット上の NTP サーバと同期 (UDP)
    Then 時刻の同期に成功

  Scenario: NTP サーバと時刻を同期 (TCP)
    Given DMZ のサーバ
    And インターネット上の NTP サーバ
    When DMZ のサーバにログイン
    And 時刻をインターネット上の NTP サーバと同期 (TCP)
    Then 時刻の同期に成功
