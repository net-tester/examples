# frozen_string_literal: true

FactoryGirl.define do

  sequence :virtual_port_number, 2

  trait :internal_network_host do
    netmask '255.255.255.0'
    gateway '10.10.10.254'
    virtual_port_number
  end

  factory :ntp_client, class: NetTester::Netns do
    internal_network_host

    name 'ntp_client'
    ip_address '10.10.10.3'
    physical_port_number 8
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :git_client, class: NetTester::Netns do
    internal_network_host

    name 'git_client'
    ip_address '10.10.10.3'
    physical_port_number 8
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :git_server, class: NetTester::Netns do
    internal_network_host

    name 'git_server'
    ip_address '10.10.10.1'
    physical_port_number 4
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :test_server, class: NetTester::Netns do
    internal_network_host

    name 'test_server'
    ip_address '10.10.10.2'
    physical_port_number 4
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :browser_pc, class: NetTester::Netns do
    internal_network_host

    name 'browser_pc'
    ip_address '10.10.10.3'
    physical_port_number 8
    mac_address {Faker::Internet.mac_address('00')}
  end

  factory :google_pc, class: NetTester::Netns do
    internal_network_host

    name 'google_pc'
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
end
