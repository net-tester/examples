Feature: ヨーヨーダイン社内部の PC から DMZ の DNS サーバに ssh

  ヨーヨーダイン社の管理者として、
  ヨーヨーダイン社内部の PC から DMZ の DNS サーバに ssh でログインしたい
  なぜなら DNS サーバをメンテナンスするから

  Scenario: ヨーヨーダイン社内部の PC から DMZ の DNS サーバに ssh
    Given ヨーヨーダイン社内部のユーザ PC
    And ヨーヨーダイン社の DMZ の DNS サーバ
    When DNS サーバに ssh でログイン
    Then ログイン成功
