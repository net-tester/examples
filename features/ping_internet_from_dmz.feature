Feature: DMZからInternet上のサーバへの疎通確認

  ヨーヨーダイン社の管理者として、
  DMZからInternet上のサーバへの疎通確認をしたい
  なぜならDMZのサーバはInternet上のサーバにアクセスする必要があるから

  Scenario: DMZからInternet上のサーバへの疎通確認
    Given ヨーヨーダイン社のDMZ内部のサーバ
    And Internet上のサーバ
    When Internet上のサーバにDMZ内部のサーバからpingで疎通確認
    Then pingで疎通成功
