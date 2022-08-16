# frozen_string_literal: true

require_relative 'web_server_logs'

# main module
module ServerLogs
  WebServerLogs.new.call
end
