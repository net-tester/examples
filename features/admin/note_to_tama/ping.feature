@wip @multi-site
Feature: VLAN 開通確認

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given VLAN ID 2002 のユーザグループ
      | 拠点 | ノード |
      | note | note1  |
      | tama | tama1  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | note1  | tama1  | O        |
      | tama1  | note1  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

