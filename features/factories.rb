# frozen_string_literal: true

FactoryGirl.define do
  trait :internal_network_host do
    netmask '255.255.255.0'
    gateway '10.10.10.254'
    mac_address { Faker::Internet.mac_address('00') }
  end

  factory :ntp_client, class: Netns do
    internal_network_host

    name 'ntp_client'
    ip_address '10.10.10.3'
    virtual_port_number 2
    physical_port_number 2
  end

  factory :git_client, class: Netns do
    internal_network_host

    name 'git_client'
    ip_address '10.10.10.3'
    virtual_port_number 2
    physical_port_number 2
  end

  factory :git_server, class: Netns do
    internal_network_host

    name 'git_server'
    ip_address '10.10.10.1'
    virtual_port_number 3
    physical_port_number 3
  end

  factory :browser_pc, class: Netns do
    internal_network_host

    name 'browser_pc'
    ip_address '10.10.10.3'
    virtual_port_number 2
    physical_port_number 2
  end

  factory :google_pc, class: Netns do
    internal_network_host

    name 'google_pc'
    ip_address '10.10.10.4'
    virtual_port_number 3
    physical_port_number 3
  end
end
