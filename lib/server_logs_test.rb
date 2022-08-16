# hello_test.rb
require "test/unit"
require_relative 'server_logs'

class ServerLogsTest < Test::Unit::TestCase
  def test_initialize
    assert_equal 'world', WebServerLogs.new
  end
end
