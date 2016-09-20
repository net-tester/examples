Feature: Google 検索

  ヨーヨーダイン社の開発者として、
  Google で検索したい
  なぜなら開発するときによく調べものをするから

  Scenario: Web ブラウザで Google を開く
    Given Web ブラウザを起動する開発者 PC
    And Google のページを起動するWebサーバ
    When ブラウザで Google のページを開く
    Then Google のトップページが表示
