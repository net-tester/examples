When(/^ヨーヨーダイン社からヨーヨーダイン社内部の資産管理サーバにsshでログイン$/) do  
  cd('.') do
    @asset_server.exec "ssh-keygen -f ./ssh-key -t rsa -b 2048 -N ''"
    @asset_server.exec "/usr/sbin/sshd -o AuthorizedKeysFile=$PWD/ssh-key.pub"
    @internal_pc.exec "bash -c 'ssh -t -t #{@asset_server.ip_address} -i ./ssh-key -o StrictHostKeyChecking=no ip a ' > log/ssh.log"
  end
end

Then(/^ヨーヨーダイン社からヨーヨーダイン社内部の資産管理サーバにsshでログイン成功$/) do
  step %(the file "log/ssh.log" should contain "#{@asset_server.ip_address}")
end
