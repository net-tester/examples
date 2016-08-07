# coding: utf-8
source 'https://rubygems.org'

gem 'aruba', require: false
gem 'cucumber', require: false

gem 'net_tester', github: 'yasuhito/net_tester', branch: 'develop'
gem 'rake'
gem 'rubocop'

# phut と trema は本来 NetTester の依存関係で自動的にインストールされるものだけど、
# NetTester が開発版を使っている関係で、この Gemfile にも追加が必要。
# net_tester.gemspec に phut と trema が入れば、下の 2 行は消してよし。
gem 'phut', github: 'trema/phut', branch: 'develop'
gem 'trema', github: 'trema/trema', branch: 'develop'
