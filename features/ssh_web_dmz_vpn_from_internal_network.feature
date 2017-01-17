Feature: ヨーヨーダイン社内部からDMZのVPNサーバにログイン

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からDMZ内のVPNサーバにsshクライアントおよびWebブラウザでログインしたい
  なぜならメンテナンス業務に必要だから

  Scenario: ヨーヨーダイン社からDMZ内のVPNサーバにsshでログイン
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のVPNサーバ
    When ヨーヨーダイン社からDMZ内のVPNサーバにsshでログイン
    Then ヨーヨーダイン社からDMZ内のVPNサーバにsshでログイン成功

  Scenario: ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからhttpでログイン
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のVPNサーバ
    When ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからhttpでログイン
    Then ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからログイン成功

  Scenario: ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからhttpsでログイン
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のVPNサーバ
    When ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからhttpsでログイン
    Then ヨーヨーダイン社からDMZ内のVPNサーバにWebブラウザからログイン成功
