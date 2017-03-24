@static_topology
Feature: 社内テスト環境接続確認

  ネットワーク管理者として、
  DMZ の VPN アドレスプールから社内のテスト環境サーバに telnet でログインしたい
  なぜなら開発業務でタジマックス社の開発者がテスト環境サーバにアクセスするから

  Scenario: テスト環境サーバへ telnet でログイン
    Given DMZ の VPN アドレスプール
    And 社内のテスト環境サーバ
    When DMZ の VPN アドレスプールにログイン
    And 社内のテスト環境サーバに telnet でログイン
    Then ログイン成功


