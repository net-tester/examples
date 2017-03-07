@static
Feature: Google 検索

  ヨーヨーダイン社の開発者として、
  Google で検索したい
  なぜなら開発するときによく調べものをするから

  Scenario: Web ブラウザで Google を開く
    Given ヨーヨーダイン社内部のユーザ PC
    And インターネット上のサーバ
    When ヨーヨーダイン社内部のユーザ PC にログイン 
    And ブラウザでインターネット上のサーバの Google のページを開く
    Then Google のトップページが表示
