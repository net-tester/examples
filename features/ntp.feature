Feature: NTPによる時刻同期

  Fahey Inc 社の開発者として、
  自分の PC からインターネットの NTP サーバにアクセスしたい
  なぜなら時刻を同期していないと make などいろいろな開発ツールがうまく動かないから

  Scenario: NTP サーバで時刻を同期
    Given IP アドレスが "10.10.10.100/24" の PC 
    When NTP サーバ "ntp.nict.jp" で PC の時刻を同期
    Then 時刻の同期が成功
