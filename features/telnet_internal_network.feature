Feature: 社内テスト環境設定

  ヨーヨーダイン社の開発者として、
  社内テストサーバにアクセスしたい
  なぜならテスト環境設定を行う必要があるから

  Scenario: 社内テストサーバへアクセス
    Given ヨーヨーダイン社内部のテスト環境サーバ
    And ヨーヨーダイン社内部のクライアント
    When 開発者 PC からテストサーバへTelnetでアクセス
    Then 社内テストサーバにアクセス成功
