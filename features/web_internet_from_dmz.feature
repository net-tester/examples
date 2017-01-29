Feature: DMZ内部サーバのパッケージアップデート

  ヨーヨーダイン社の管理者として、
  DMZ内部サーバのパッケージアップデートを行いたい
  なぜならアップデートにより機能を最新に保ち、セキュリティも保全できるから

  Scenario: DMZ内部サーバのパッケージをhttpでアップデート
    Given ヨーヨーダイン社のDMZ内部のサーバ
    And Internet上のアップデートサーバ
    When httpでパッケージアップデートの実行
    Then アップデートパッケージの取得に成功

  Scenario: DMZ内部サーバのパッケージをhttpsでアップデート
    Given ヨーヨーダイン社のDMZ内部のサーバ
    And Internet上のアップデートサーバ
    When httpsでパッケージアップデートの実行
    Then アップデートパッケージの取得に成功
