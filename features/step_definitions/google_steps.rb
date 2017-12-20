# coding: utf-8
When(/^ブラウザで Google のページを開く$/) do
  cd('.') do
    @process_id = @src_host.exec('curl -L --insecure  https://www.google.com/ | iconv -f SHIFT-JIS -t UTF8')
  end
end

When(/^ブラウザでインターネット上のサーバの Google のページを開く$/) do
  cd('.') do
    @internet_host.exec("echo '<title>Google</title>' > index.html", sync: true)
    @https_service = @internet_host
    @https_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    @src_host.exec("sudo mkdir -p /etc/netns/#{@src_host.name}", sync: true)
    @src_host.exec("echo '198.51.100.3 www.google.com' | sudo tee /etc/netns/#{@src_host.name}/hosts >/dev/null", sync: true)
    @process_id = @src_host.exec('curl -L --insecure  https://www.google.com/ | iconv -f SHIFT-JIS -t UTF8', delayed: true)
  end
end
