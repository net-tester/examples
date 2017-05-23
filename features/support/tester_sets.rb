# coding: utf-8

# tester setの定義
def tester_sets
  {
    'note' => {
      ip_address: '192.168.20.166',
      dpid: ENV['DPID'],
      device: ENV['DEVICE']
    },
    'tama' => {
      ip_address: '192.168.20.169',
      dpid: ENV['DPID'],
      device: ENV['DEVICE']
    }
  }
end
