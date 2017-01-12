Feature: ヨーヨーダイン社内部からDMZのDNSサーバにsshでログイン

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からDMZ内のDNSサーバにsshでログインしたい
  なぜならメンテナンス業務に必要だから

  Scenario: ヨーヨーダイン社からDMZ内のDNSサーバにsshでログイン
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内のDNSサーバ
    When ヨーヨーダイン社からDMZ内のDNSサーバにsshでログイン
    Then ヨーヨーダイン社からDMZ内のDNSサーバにsshでログイン成功
