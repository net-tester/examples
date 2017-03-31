@wip @multi-site
Feature: VLAN 開通確認

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 拠点 note
    And ノード note1
    Given 拠点 tama
    And ノード tama1
    And VLAN ID 2002
    When note1 にログイン
    And tama1 に ping
    Then ping 成功
