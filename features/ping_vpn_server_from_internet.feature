Feature: InternetからSSLVPNサーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  InternetからSSLVPNサーバへの疎通確認をしたい
  なぜならタジマックス社の開発者はSSLVPNサーバを経由して開発環境にアクセスするから

  Scenario: InternetからSSLVPNサーバへの疎通確認
    Given  Internet上のPC
    And ヨーヨーダイン社のDMZ内部のVPNサーバ
    When SSLVPNサーバにInternet上のPCからpingで疎通確認
    Then pingで疎通成功
