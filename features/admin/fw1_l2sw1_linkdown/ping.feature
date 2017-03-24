@failure_recovery
Feature: FW1 - L2SW1 間リンク障害試験
  ヨーヨーダイン社およびタジマックス社社員として
  ヨーヨーダイン社 FW に単発の障害が起きたときでも a, b, c の経路を通じて開発環境にアクセスしたい
  なぜなら開発環境に接続できなくなると業務がストップしてしまうから

  Scenario: リンクダウンの発生後の Failover 確認[a]
    Given VPN サーバ
    And タジマックス社の PC
    When タジマックス社の PC から VPN サーバに ping を連続実行
    And 10 秒待つ
    And FW1 - L2SW1 間リンク障害発生
    Then タジマックス社の PC から VPN サーバへの ping が 10 秒以内に復帰
    And FW の主系が Passive 、予備系が Active になっている

  Scenario: リンクダウンの発生後のFailback確認[a]
    Given VPN サーバ
    And タジマックス社の PC
    When タジマックス社の PC から VPN サーバに ping を連続実行
    And 10 秒待つ
    And FW1 - L2SW1 間リンク障害回復
    Then タジマックス社の PC から VPN サーバへの ping が 10 秒以内に復帰
    And FW の主系が Active 、予備系が Passive になっている

  Scenario: リンクダウンの発生後の Failover 確認[b]
    Given 社内 PC
    And DMZ のサーバ
    When 社内 PC から DMZ サーバに ping を連続実行
    And 10 秒待つ
    And FW1 - L2SW1 間リンク障害発生
    Then 社内 PC から DMZ のサーバへの ping が 10 秒以内に復帰
    And FW の主系が Passive 、予備系が Active になっている

  Scenario: リンクダウンの発生後のFailback確認[b]
    Given 社内 PC
    And DMZ のサーバ
    When 社内 PC から DMZ サーバに ping を連続実行
    And 10 秒待つ
    And FW1 - L2SW1 間リンク障害回復
    Then 社内 PC から DMZ のサーバへの ping が 10 秒以内に復帰
    And FW の主系が Active 、予備系が Passive になっている

  Scenario: リンクダウンの発生後の Failover 確認[c]
    Given 社内 PC
    And インターネット上の PC
    When 社内 PC からインターネット上の PC に ping を連続実行
    And 10 秒待つ
    And FW1 - L2SW1 間リンク障害発生
    Then 社内 PC からインターネット上の PC への ping が 10 秒以内に復帰
    And FW の主系が Passive 、予備系が Active になっている

  Scenario: リンクダウンの発生後のFailback確認[c]
    Given 社内 PC
    And インターネット上の PC
    When 社内 PC からインターネット上の PC に ping を連続実行
    And 10 秒待つ
    And FW1 - L2SW1 間リンク障害回復
    Then 社内 PC からインターネット上の PC への ping が 10 秒以内に復帰
    And FW の主系が Active 、予備系が Passive になっている

