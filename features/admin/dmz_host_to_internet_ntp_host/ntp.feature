@static
Feature: NTP で時刻を同期

  ヨーヨーダイン社の管理者として、
  インターネット上の NTP サーバを使って DMZ のサーバの時刻を同期したい
  なぜなら時刻を同期していないとログ管理などで時刻がずれて運用で困るから

  Scenario: NTP サーバと udp で時刻を同期
    Given ヨーヨーダイン社の DMZ のサーバ
    And インターネット上の NTP サーバ
    When ヨーヨーダイン社の DMZ のサーバにログイン
    And 時刻をインターネット上の NTP サーバと udp で同期
    Then 時刻の同期に成功

  Scenario: NTP サーバと tcp で時刻を同期
    Given ヨーヨーダイン社の DMZ のサーバ
    And インターネット上の NTP サーバ
    When ヨーヨーダイン社の DMZ のサーバにログイン
    And 時刻をインターネット上の NTP サーバと tcp で同期
    Then 時刻の同期に成功
