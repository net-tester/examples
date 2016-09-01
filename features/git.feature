Feature: 社内 Git サービス

  Fahey Inc 社の開発者として、
  社内 Git サーバにアクセスしたい
  なぜならソースコードを社内 Git サーバで管理しているから

  @nc
  Scenario: 社内 Git サービスへアクセス
    Given Fahey Inc 社 の Git リポジトリサーバ
    And Git クライアントとなる開発者 PC
    When 開発者 PC から社内 Git リポジトリへアクセス
    Then 社内 Git リポジトリにアクセス成功
