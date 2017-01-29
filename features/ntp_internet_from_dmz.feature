Feature: NTP で時刻を同期

  ヨーヨーダイン社の管理者として、
  インターネット上の NTP サーバを使ってDMZのサーバの時刻を同期したい
  なぜなら時刻を同期していないとログ管理などで時刻がずれ運用が困難になるから

  Scenario: NTP サーバとudpで時刻を同期
    Given ヨーヨーダイン社のDMZ内部のサーバ
    And Internet上のNPTサーバ
    When インターネット上の NTP サーバでDMZのサーバの時刻をudpで同期
    Then 時刻の同期に成功

  Scenario: NTP サーバとtcpで時刻を同期
    Given ヨーヨーダイン社のDMZ内部のサーバ
    And Internet上のNPTサーバ
    When インターネット上の NTP サーバでDMZのサーバの時刻をtcpで同期
    Then 時刻の同期に成功
