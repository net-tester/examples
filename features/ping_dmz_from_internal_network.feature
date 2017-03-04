@static
Feature: ヨーヨーダイン社内部からヨーヨーダイン社の DMZ のサーバへ ping

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部からヨーヨーダイン社の DMZ のサーバへつながるか確認をしたい
  なぜならヨーヨーダイン社の開発者は DMZ 上のサーバにアクセスする必要があるから

  Scenario: ヨーヨーダイン社内部から DMZ への疎通確認
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ のサーバ
    When ヨーヨーダイン社内部のユーザ PC にログイン
    And ヨーヨーダイン社の DMZ のサーバに ping
    Then ping 成功
