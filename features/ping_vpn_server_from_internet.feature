Feature: インターネットから VPN サーバへ ping

  ヨーヨーダイン社の管理者として、
  インターネットから VPN サーバにつながるか確認したい
  なぜならタジマックス社の開発者は VPN サーバを経由して開発環境にアクセスするから

  Scenario: インターネットから VPN サーバへ ping
    Given インターネット上の PC
    And ヨーヨーダイン社の VPN サーバ
    When VPN サーバにインターネット上の PC から ping
    Then ping 成功
