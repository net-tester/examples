# coding: utf-8
When(/^ヨーヨーダイン社からヨーヨーダイン社内部の資産管理サーバにsshでログイン$/) do  
  cd('.') do
    @internal_pc.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @asset_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @internal_pc.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@asset_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no ip a ' > log/ssh.log"
  end
end

When(/^ヨーヨーダイン社からヨーヨーダイン社内部のテスト環境サーバへsshでログイン$/) do
  cd('.') do
    @internal_pc.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @test_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @internal_pc.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@test_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no ip a ' > log/ssh.log"
  end
end

When(/^DNS サーバに ssh でログイン$/) do
  cd('.') do
    @user_pc.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @dns_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @user_pc.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@dns_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no echo LoginOK' > log/login.log"
  end
end

When(/^VPN サーバに ssh でログイン$/) do
  cd('.') do
    @user_pc.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @vpn_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @user_pc.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@vpn_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no echo LoginOK' > log/login.log"
  end
end

When(/^DMZ のサーバに ssh でログイン$/) do
  cd('.') do
    @user_pc.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @dmz_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @user_pc.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@dmz_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no echo LoginOK' > log/login.log"
  end
end

Then(/^ヨーヨーダイン社からヨーヨーダイン社内部の資産管理サーバにsshでログイン成功$/) do
  step %(the file "log/ssh.log" should contain "#{@asset_host.ip_address}")
end

Then(/^ヨーヨーダイン社からヨーヨーダイン社内部のテスト環境サーバへsshでログイン成功$/) do
  step %(the file "log/ssh.log" should contain "#{@test_host.ip_address}")
end

Then(/^ヨーヨーダイン社からDMZ内のDNSサーバにsshでログイン成功$/) do
  step %(the file "log/ssh.log" should contain "#{@dns_host.ip_address}")
end
