Feature: ヨーヨーダイン社内部の PC から DMZ 内の DNS サーバに ssh でログイン

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部の PC から DMZ 内の DNS サーバに ssh でログインしたい
  なぜならメンテナンス業務に必要だから

  Scenario: ヨーヨーダイン社内部の PC から DMZ 内の DNS サーバに ssh でログイン
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ 内の DNS サーバ
    When DNS サーバに ssh でログイン
    Then ログイン成功
