@wip
Feature: Web サーバアクセスの宛先ポート番号によるフィルタリング

  ファイアウォール管理者として、
  Web サーバへのアクセスを宛先ポート番号によってフィルタリングしたい
  なぜなら実験用に立てた Rails などの Web サーバを外部からアクセスされたくないから

  Background:
    Given NetTester で次のホストを起動:
      | Hostname |   IP Address | Virtual Port |
      | client   |  192.168.0.1 |            1 |
    And NetTester で次のパッチを追加:
      | Virtual Port | Physical Port |
      |            1 |             1 |

  Scenario: 宛先ポートが 80 番の HTTP は通る
    Given Web サーバの URL は http://172.16.1.100/
    When NetTester のホスト "client" から http://172.16.1.100/ を HTTP GET
    Then HTTP ステータス 200 が返る

  Scenario: 宛先ポートが 3000 番の HTTP はブロック
    Given NetTester で次のホストを起動:
      | Hostname |   IP Address | Virtual Port |
      | server   | 172.16.2.200 |            2 |
    And NetTester で次のパッチを追加:
      | Virtual Port | Physical Port |
      |            2 |             2 |
    And NetTester のホスト "server" でダミーの Web サーバをポート 3000 番で起動
    When NetTester のホスト "client" から http://172.16.1.200:3000/ を HTTP GET
    Then HTTP GET がタイムアウトで失敗する
