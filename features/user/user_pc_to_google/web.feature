@internet @static_topology
Feature: Google 検索

  開発者として、
  Google で検索したい
  なぜなら開発するときによく調べものをするから

  Scenario: Web ブラウザで Google を開く
    Given 社内 PC
    When 社内 PC にログイン
    And ブラウザで Google のページを開く
    Then Google のトップページが表示
