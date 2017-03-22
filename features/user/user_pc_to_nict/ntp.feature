@internet @static
Feature: NTP で時刻を同期

  開発者として、
  インターネット上の NTP サーバを使って自分の PC の時刻を同期したい
  なぜなら時刻がばらばらだと make などの開発ツールがうまく動かないから

  Scenario: NTP サーバで時刻を同期
    Given 社内 PC
    When 社内 PC にログイン
    And 時刻をインターネット上の NTP サーバと同期
    Then 時刻の同期に成功
