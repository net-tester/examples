# frozen_string_literal: true

FactoryGirl.define do
  trait :internal_network_host do
    netmask '255.255.255.0'
    gateway '10.10.10.254'
    sequence(:ip_address, 3) { |n| "10.10.10.#{n}" }
    mac_address Faker::Internet.mac_address('00')

    sequence :virtual_port_number, 2
    sequence :physical_port_number, 2
  end

  factory :ntp_client, class: NetTester::Netns do
    name 'ntp_client'
    internal_network_host
  end
end
