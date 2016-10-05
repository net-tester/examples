# frozen_string_literal: true

FactoryGirl.define do
  trait :internal_network_host do
    netmask '255.255.255.0'
    gateway '10.10.10.254'
  end

  factory :ntp_client, class: Netns do
    internal_network_host

    name 'ntp_client'
    ip_address '10.10.10.3'
    virtual_port_number 8
    physical_port_number 8
    mac_address {'00:00:00:00:00:02'}
  end

  factory :git_client, class: Netns do
    internal_network_host

    name 'git_client'
    ip_address '10.10.10.3'
    virtual_port_number 8
    physical_port_number 8
    mac_address {'00:00:00:00:00:03'}
  end

  factory :git_server, class: Netns do
    internal_network_host

    name 'git_server'
    ip_address '10.10.10.1'
    virtual_port_number 4
    physical_port_number 4
    mac_address {'00:00:00:00:00:04'}
  end

  factory :browser_pc, class: Netns do
    internal_network_host

    name 'browser_pc'
    ip_address '10.10.10.3'
    virtual_port_number 8
    physical_port_number 8
    mac_address {'00:00:00:00:00:06'}
  end

  factory :google_pc, class: Netns do
    internal_network_host

    name 'google_pc'
    ip_address '10.10.10.4'
    virtual_port_number 3
    physical_port_number 3
    mac_address {'00:00:00:00:00:13'}
  end

  factory :internal_pc, class: NetTester::Netns do
    name 'internal_pc'
    internal_network_host

    ip_address '10.10.10.4'
    virtual_port_number 8
    physical_port_number 8
    mac_address {'00:00:00:00:00:07'}
  end

  trait :dmz_network do
    netmask '255.255.255.0'
    gateway '10.10.0.1'
  end

  factory :dmz_server, class: NetTester::Netns do
    name 'dmz_server'
    dmz_network
    ip_address '10.10.0.100'
    virtual_port_number 9
    physical_port_number 9
    mac_address {'00:00:00:00:00:10'}
  end
end
