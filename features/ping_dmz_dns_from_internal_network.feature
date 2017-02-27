@internet @nointernet @static
Feature: ヨーヨーダイン社内部からDNSサーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からDNSへの疎通確認をしたい
  なぜならヨーヨーダイン社の開発者はDNSサーバにアクセスする必要があるから

  Scenario: ヨーヨーダイン社内部からDNSサーバへの疎通確認
    Given ヨーヨーダイン社内部のクライアント
    And ヨーヨーダイン社のDMZ内のDNSサーバ
    When DNSサーバにヨーヨーダイン社PCからpingで疎通確認
    Then ping 成功
