Feature: ヨーヨーダイン社内部からInternet上のサーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からInternet上のサーバへの疎通確認をしたい
  なぜならヨーヨーダイン社の開発者はInternet上のサーバにアクセスする必要があるから

  Scenario: ヨーヨーダイン社内部からInternet上のサーバへの疎通確認
    Given ヨーヨーダイン社内部のクライアント
    And Internet上のサーバ
    When Internet上のサーバにヨーヨーダイン社のPCからpingで疎通確認
    Then ping で疎通成功
