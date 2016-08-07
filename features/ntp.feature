Feature: NTP による時刻同期

  Fahey Inc 社の開発者として、
  自分の PC からインターネットの NTP サーバにアクセスしたい
  なぜなら時刻を同期していないと make などいろいろな開発ツールがうまく動かないから

  Scenario: NTP サーバで時刻を同期
    Given DPID が 0x123 の NetTester 物理スイッチ
    And NetTester をネットワークデバイス "eth1" で起動
    And 開発者の PC:
      | virtual port |   IP address |       netmask | default gateway |
      |            2 | 10.10.10.100 | 255.255.255.0 |    10.10.10.254 |
    And 開発者の PC を NetTester 物理スイッチのポート 2 番にパッチで接続
    When NTP サーバ "ntp.nict.jp" で PC の時刻を同期
    Then 時刻の同期に成功
