# coding: utf-8
When(/^ブラウザで Google のページを開く$/) do
  cd('.') do
    @src_host.exec 'curl -L --insecure  https://www.google.com/ | iconv -f SHIFT-JIS -t UTF8 > log/google.log'
  end
end

When(/^ブラウザでインターネット上のサーバの Google のページを開く$/) do
  cd('.') do
    system "echo '<title>Google</title>' > index.html"
    @https_service = AsyncExecutor.new(host: @internet_host, result_file: 'log/google_host.stdout', stderr_file: 'log/google_host.stderr')
    @https_service.exec("ruby -rwebrick -rwebrick/https -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 443, :SSLEnable => true, :SSLCertName => [[\"CN\", WEBrick::Utils::getservername]] ).start'")
    system "sudo mkdir -p /etc/netns/#{@src_host.name}"
    system "echo '198.51.100.3 www.google.com' | sudo tee /etc/netns/#{@src_host.name}/hosts >/dev/null"
    @src_host.exec 'curl -L --insecure  https://www.google.com/ | iconv -f SHIFT-JIS -t UTF8 > log/google.log'
  end
end
