# coding: utf-8
source 'https://rubygems.org'

gem 'aruba', require: false
gem 'cucumber', require: false

gem 'net_tester', github: 'net-tester/net-tester', branch: 'develop'
gem 'rake'
gem 'rubocop'
gem 'factory_girl'

# phut, pio と trema は本来 NetTester の依存関係で自動的にインストールされるものだけど、
# NetTester が開発版を使っている関係で、この Gemfile にも追加が必要。
# net-tester.gemspec に phut, pio と trema が入れば、下の 3 行は消してよし。
gem 'pio', github: 'trema/pio', branch: 'develop'
gem 'phut', github: 'trema/phut', branch: 'develop'
gem 'trema', github: 'trema/trema', branch: 'develop'
