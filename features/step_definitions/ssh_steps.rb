When(/^ヨーヨーダイン社からヨーヨーダイン社内部の資産管理サーバにsshでログイン$/) do  
  cd('.') do
    @internal_pc.exec "sudo ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @asset_server.exec "sudo /usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub -o PubkeyAuthentication=yes"
    @internal_pc.exec "bash -c 'sudo ssh -t -t $SUDO_USER@#{@asset_server.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no ip a ' > log/ssh.log"
  end
end

Then(/^ヨーヨーダイン社からヨーヨーダイン社内部の資産管理サーバにsshでログイン成功$/) do
  step %(the file "log/ssh.log" should contain "#{@asset_server.ip_address}")
end
