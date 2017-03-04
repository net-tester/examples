@static
Feature: インターネットからヨーヨーダイン社の Router への疎通確認

  ヨーヨーダイン社の管理者として、
  インターネットからヨーヨーダイン社の Router への疎通確認をしたい
  なぜならインターネットからのアクセスは Router を経由するから

  Scenario: インターネットからヨーヨーダイン社の Router への疎通確認
    Given インターネット上の PC
    When インターネット上の PC にログイン
    And Router に ping
    Then ping 成功
