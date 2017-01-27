Feature: タジマックス工業のPCからSSLVPNサーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  タジマックス工業からSSLVPN サーバへの疎通確認をしたい
  なぜならタジマックス工業の開発者はSSLVPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス工業のPCからSSLVPNサーバに疎通確認
    Given タジマックス工業のPC
    And ヨーヨーダイン社のDMZ内部のVPNサーバ
    When SSLVPNサーバにタジマックス工業のPCからpingで疎通確認
    Then pingで疎通成功

