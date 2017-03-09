@static
Feature: ヨーヨーダイン社の DMZ のサーバからヨーヨーダイン社内部へ ping

  ヨーヨーダイン社の管理者として、
  DMZ からヨーヨーダイン社内部へつながるか確認をしたい
  なぜなら DMZ のサーバはヨーヨーダイン社内部にアクセスする必要があるから

  Scenario: DMZからヨーヨーダイン社内部へ ping
    Given ヨーヨーダイン社の DMZ のサーバ
    And ヨーヨーダイン社内部のユーザ PC
    When ヨーヨーダイン社の DMZ のサーバにログイン
    And ヨーヨーダイン社内部のユーザ PC に ping
    Then ping 成功