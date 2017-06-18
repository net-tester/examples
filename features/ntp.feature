@internet @static
Feature: NTP で時刻を同期

  ヨーヨーダイン社の開発者として、
  インターネット上の NTP サーバを使って自分の PC の時刻を同期したい
  なぜなら時刻を同期していないと make などいろいろな開発ツールがうまく動かないから

  Scenario: NTP サーバで時刻を同期
    Given NTP クライアントとなる開発者 PC
    When インターネット上の NTP サーバで開発者 PC の時刻を同期
    Then 時刻の同期に成功
