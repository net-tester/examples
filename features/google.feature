@internet @static
Feature: Google 検索

  ヨーヨーダイン社の開発者として、
  Google で検索したい
  なぜなら開発するときによく調べものをするから

  Scenario: Web ブラウザで Google を開く
    Given Web ブラウザを起動する開発者 PC
    When ブラウザで Google のページを開く
    Then Google のトップページが表示
