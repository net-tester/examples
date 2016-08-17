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
      virtual_port_number = generate(:virtual_port_number)
      virtual_port_name = "port#{virtual_port_number}"
      link = Phut::Link.create(netns.name, virtual_port_name)
      NetTester.connect_switch(device: link.device(virtual_port_name),
                               port_number: virtual_port_number)
      NetTester.create_patch(source_port: virtual_port_number,
                             source_mac_address: netns.mac_address,
                             destination_port: physical_port_number)
      netns.device = link.device(netns.name)
      netns
    end
  end
end
