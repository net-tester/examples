Feature: タジマックス工業のPCからSSLVPNサーバへのログイン

  ヨーヨーダイン社の管理者として、
  タジマックス工業からSSLVPN サーバへログインしたい
  なぜならタジマックス工業の開発者はSSLVPN サーバを経由して開発環境にアクセスするから

  Scenario: タジマックス工業のPCからSSLVPNサーバにログイン
    Given タジマックス工業のPC
    And ヨーヨーダイン社のDMZ内部のVPNサーバとVPNプロセス
    When SSLVPNサーバにタジマックス工業のPCからログイン
    Then SSLVPNサーバにログイン成功

