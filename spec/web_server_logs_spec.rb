# frozen_string_literal: true

require 'web_server_logs'

describe WebServerLogs do
  let(:logs) { File.readlines('../webserver.log') }
  let(:result) do
    [{ '/about' => 81, '/about/2' => 90, '/contact' => 89,
       '/help_page/1' => 80, '/home' => 78, '/index' => 82 },
     { '/about' => 21, '/about/2' => 22, '/contact' => 23,
       '/help_page/1' => 23, '/home' => 23, '/index' => 23 }]
  end

  describe '#initialize' do
    it 'should reads logs and initialize data hash' do
      response = WebServerLogs.new
      expect(response.logs).to eql(logs)
      expect(response.data).to eql({})
    end
  end

  describe '#call' do
    it 'should return unique visits' do
      expect(WebServerLogs.new.call).to eq(result)
    end
  end
end
