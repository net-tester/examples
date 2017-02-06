# frozen_string_literal: true

FactoryGirl.define do

  sequence :virtual_port_number, 2

  trait :internal_network_host do
    netmask '255.255.255.0'
    gateway '10.10.10.254'
    virtual_port_number
  end

  factory :ntp_client, class: NetTester::Netns do
    name 'ntp_client'
    internal_network_host
    ip_address '10.10.10.3'
    physical_port_number 8
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :git_client, class: NetTester::Netns do
    name 'git_client'
    internal_network_host
    ip_address '10.10.10.3'
    physical_port_number 8
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :git_server, class: NetTester::Netns do
    name 'git_server'
    internal_network_host
    ip_address '10.10.10.1'
    physical_port_number 4
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :test_server, class: NetTester::Netns do
    name 'test_server'
    internal_network_host
    ip_address '10.10.10.2'
    physical_port_number 4
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :browser_pc, class: NetTester::Netns do
    name 'browser_pc'
    internal_network_host
    ip_address '10.10.10.3'
    physical_port_number 8
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :google_pc, class: NetTester::Netns do
    name 'google_pc'
    internal_network_host
    ip_address '10.10.10.4'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :internal_pc, class: NetTester::Netns do
    name 'internal_pc'
    internal_network_host
    ip_address '10.10.10.4'
    physical_port_number 8
    mac_address {Faker::Internet.mac_address('00')}
  end

  trait :dmz_network do
    netmask '255.255.255.0'
    gateway '10.10.0.1'
    virtual_port_number
  end

  factory :dmz_server, class: NetTester::Netns do
    name 'dmz_server'
    dmz_network
    ip_address '10.10.0.100'
    physical_port_number 9
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :dns_server, class: NetTester::Netns do
    name 'dns_server'
    dmz_network
    ip_address '10.10.0.10'
    physical_port_number 5
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :vpn_server, class: NetTester::Netns do
    name 'vpn_server'
    dmz_network
    ip_address '10.10.0.11'
    physical_port_number 10
    vlan_id 2023
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :vpn_address_pool, class: NetTester::Netns do
    name 'vpn_addrpool'
    dmz_network
    ip_address '10.10.0.130'
    physical_port_number 9
    mac_address {Faker::Internet.mac_address('00')}
  end

  trait :internet_network do
    netmask '255.255.255.0'
    gateway '198.51.100.254'
    virtual_port_number
  end

  factory :internet_pc, class: NetTester::Netns do
    name 'internet_pc'
    internet_network
    ip_address '198.51.100.1'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :internet_dns, class: NetTester::Netns do
    name 'internet_dns'
    internet_network
    ip_address '198.51.100.2'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :internet_server, class: NetTester::Netns do
    name 'internet_svr'
    internet_network
    ip_address '198.51.100.3'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :tajimax_pc, class: NetTester::Netns do
    name 'tajimax_pc'
    internet_network
    ip_address '198.51.100.94'
    physical_port_number 3
    mac_address {Faker::Internet.mac_address('00')}
  end
end
