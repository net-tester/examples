@static
Feature: ヨーヨーダイン社内部からDNSサーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からDNSへの疎通確認をしたい
  なぜならヨーヨーダイン社の開発者はDNSサーバにアクセスする必要があるから

  Scenario: ヨーヨーダイン社内部からDNSサーバへの疎通確認
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ の DNS サーバ
    When ヨーヨーダイン社内部のユーザ PC にログイン
    And ヨーヨーダイン社の DMZ の DNS サーバに ping
    Then ping 成功
