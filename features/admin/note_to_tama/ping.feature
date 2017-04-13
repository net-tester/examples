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
    When note1 にログイン
    And tama1 に ping
    Then ping 成功
