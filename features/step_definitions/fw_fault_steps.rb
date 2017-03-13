# coding: utf-8
require 'expectacle'

When(/^FW1 - L2SW1 間リンク障害発生$/) do
  cd('.') do
    make_port_down(14)
    make_port_down(15)
  end
end

When(/^FW1 - L2SW1 間リンク障害回復$/) do
  cd('.') do
    make_port_up(14)
    make_port_up(15)
  end
end

When(/^FW1 - L2SWEX 間リンク障害発生$/) do
  cd('.') do
    make_port_down(12)
    make_port_down(13)
  end
end

When(/^FW1 - L2SWEX 間リンク障害回復$/) do
  cd('.') do
    make_port_up(12)
    make_port_up(13)
  end
end

When(/^(\d+) 秒待つ$/) do |seconds|
  sleep seconds.to_i
end

Then(/^FW の主系が (\w+) 、予備系が (\w+) になっていること$/) do |primary, secondary|
  status = ''
  base_dir = "#{__dir__}/../support/expectacle"
  result = `bundle exec run_command -r -b #{base_dir} -h ssg_host_1.yml -c ssg_get_nsrp_status.yml`.split("\n")
  result.each_with_index{|line, index|
    if line =~ /group priority preempt holddown inelig   master/
      if result[index+1].split(" ")[5] =~ /myself/
        status = "Active"
      else
        status = "Passive"
      end
    end
  }
  expect(status).to match /#{primary}/i

  result = `bundle exec run_command -r -b #{base_dir} -h ssg_host_2.yml -c ssg_get_nsrp_status.yml`.split("\n")
  result.each_with_index{|line, index|
    if line =~ /group priority preempt holddown inelig   master/
      if result[index+1].split(" ")[5] =~ /myself/
        status = "Active"
      else
        status = "Passive"
      end
    end
  }
  expect(status).to match /#{secondary}/i
end
