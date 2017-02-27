@internet @nointernet @static
Feature: ヨーヨーダイン社内部からヨーヨーダイン社の DMZ 内のサーバへ ping

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からヨーヨーダイン社の DMZ のサーバへつながるか確認をしたい
  なぜならヨーヨーダイン社の開発者は DMZ 上のサーバにアクセスする必要があるから

  Scenario: ヨーヨーダイン社内部から DMZ への疎通確認
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社の DMZ のサーバ
    When DMZにヨーヨーダイン社のPCからpingで疎通確認
    Then ping 成功
