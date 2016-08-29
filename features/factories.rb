# frozen_string_literal: true

FactoryGirl.define do
  factory :internal_network, class: OpenStruct do
    sequence(:ip_address, 3) { |n| "10.10.10.#{n}" }
    mac_address Faker::Internet.mac_address('00')
    netmask '255.255.255.0'
    gateway '10.10.10.254'
  end

  sequence :virtual_port_number, 2

  factory :ntp_client, class: Phut::Netns do
    skip_create

    transient do
      internal_network { build(:internal_network) }
      physical_port_number 2
    end

    initialize_with do
      netns = Phut::Netns.create(name: 'ntp_client',
                                 mac_address: internal_network.mac_address,
                                 ip_address: internal_network.ip_address,
                                 netmask: internal_network.netmask,
                                 route: { net: '0.0.0.0',
                                          gateway: internal_network.gateway })
      NetTester.patch_netns_to_physical_port(netns: netns,
                                             virtual_port_number: generate(:virtual_port_number),
                                             physical_port_number: physical_port_number)
      netns
    end
  end
end
