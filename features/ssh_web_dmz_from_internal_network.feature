Feature: ヨーヨーダイン社内部からDMZ内のサーバにログイン

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からDMZ内のサーバにsshクライアントおよびWebブラウザでログインしたい
  なぜならメンテナンス業務に必要だから

  Scenario: ヨーヨーダイン社からDMZ内のサーバにsshでログイン
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のサーバ
    When ヨーヨーダイン社からDMZ内のサーバにsshでログイン
    Then ヨーヨーダイン社からDMZ内のサーバにsshでログイン成功

  Scenario: ヨーヨーダイン社からDMZ内のサーバにWebブラウザからhttpでログイン
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のサーバ
    When ヨーヨーダイン社からDMZ内のサーバにWebブラウザからhttpでログイン
    Then ヨーヨーダイン社からDMZ内のサーバにWebブラウザからログイン成功

  Scenario: ヨーヨーダイン社からDMZ内のサーバにWebブラウザからhttpsでログイン
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内部のサーバ
    When ヨーヨーダイン社からDMZ内のサーバにWebブラウザからhttpsでログイン
    Then ヨーヨーダイン社からDMZ内のサーバにWebブラウザからログイン成功
