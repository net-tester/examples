Feature: 社内 Git サービス

  ヨーヨーダイン社の開発者として、
  社内 Git サーバにアクセスしたい
  なぜならソースコードを社内 Git サーバで管理しているから

  Scenario: 社内 Git サービスへアクセス
    Given ヨーヨーダイン社 の Git リポジトリサーバ
    And Git クライアントとなる開発者 PC
    When 開発者 PC から社内 Git リポジトリへアクセス
    Then 社内 Git リポジトリにアクセス成功
