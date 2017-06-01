# coding: utf-8
# frozen_string_literal: true

require 'active_support/core_ext/object/try'
require 'expectacle'
require 'net/ssh'
require 'httpclient'

# tester setは１箇所定義にしたいのでこうしている
require File.expand_path("../tester_sets.rb", __FILE__)

Before do
  # TODO: work-around なぜか初回にいきなりhostを作るとISEになるので、一回削除を挟んでおく
  tester_sets.each{|_, tester_set|
    client = HTTPClient.new
    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    res = client.delete(apiroot + "sites")
  }
  # TODO: エラーチェック
end

After do
  tester_sets.each{|_, tester_set|
    client = HTTPClient.new
    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    res = client.delete(apiroot + "sites")
  }
  # TODO: エラーチェック
end
