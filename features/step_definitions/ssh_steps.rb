# coding: utf-8
When(/^社内の資産管理サーバに ssh でログイン$/) do
  cd('.') do
    @src_host.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @asset_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @src_host.exec "bash -c 'sudo ssh -t $SUDO_USER@#{@asset_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no echo AccessOK' > log/access.log"
  end
end

When(/^社内のテスト環境サーバに ssh でログイン$/) do
  cd('.') do
    @src_host.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @test_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @src_host.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@test_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no echo AccessOK' > log/access.log"
  end
end

When(/^DMZ の DNS サーバに ssh でログイン$/) do
  cd('.') do
    @src_host.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @dns_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @src_host.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@dns_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no echo AccessOK' > log/access.log"
  end
end

When(/^VPN サーバに ssh でログイン$/) do
  cd('.') do
    @src_host.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @vpn_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @src_host.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@vpn_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no echo AccessOK' > log/access.log"
  end
end

When(/^DMZ のサーバに ssh でログイン$/) do
  cd('.') do
    @src_host.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @dmz_host.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @src_host.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@dmz_host.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no echo AccessOK' > log/access.log"
  end
end
