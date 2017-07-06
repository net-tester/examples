# coding: utf-8
# frozen_string_literal: true

# tester setは１箇所定義にしたいのでこうしている
require File.expand_path("../support/tester_sets.rb", __FILE__)

class DummyNetns
    def initialize(name:,
                   mac_address:,
                   ip_address:,
                   netmask:,
                   gateway:,
                   virtual_port_number:,
                   physical_port_number:,
                   vlan_id: nil)
    end
    def method_missing(method, *args, &block)
      __send__ method, *args, &block
    end

end

FactoryGirl.define do

  sequence :virtual_port_number, 2

  trait :note do
    tester_set_name 'note'
    tester_set tester_sets['note'][:ip_address]
    netmask '255.255.255.0'
    virtual_port_number
    gateway '198.51.100.254'
  end

  factory :note1_host, class: DummyNetns do
    name 'note1_host'
    note
    ip_address '198.51.100.10'
    physical_port_number 2
    mac_address '00:00:5e:00:53:01'
  end

  factory :note2_host, class: DummyNetns do
    name 'note2_host'
    note
    ip_address '198.51.100.11'
    physical_port_number 3
    mac_address '00:00:5e:00:53:02'
  end

  trait :tama do
    tester_set_name 'tama'
    tester_set tester_sets['tama'][:ip_address]
    netmask '255.255.255.0'
    virtual_port_number
    gateway '198.51.100.254'
  end

  factory :tama1_host, class: DummyNetns do
    name 'tama1_host'
    tama
    ip_address '198.51.100.20'
    physical_port_number 3
    mac_address '00:00:5e:00:53:03'
  end

  factory :tama2_host, class: DummyNetns do
    name 'tama2_host'
    tama
    ip_address '198.51.100.21'
    physical_port_number 2
    mac_address '00:00:5e:00:53:04'
  end
end
