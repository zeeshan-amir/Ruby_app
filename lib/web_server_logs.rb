# frozen_string_literal: true

# web_server class
class WebServerLogs
  attr_reader :data, :logs

  FILE_PATH = '../webserver.log'

  def initialize
    @data = {}
    @logs = read_logs
  end

  def call
    process_logs
    print_result(high_to_low_visits(data.clone), unique_visits(data.clone))
  end

  private

  def read_logs
    File.readlines(FILE_PATH)
  end

  def process_logs
    logs.each do |log|
      url, user = log.split(' ')
      if data.key? url
        data[url] << user
      else
        data[url] = [user]
      end
    end
  end

  def high_to_low_visits(data)
    data.each do |k, v|
      data[k] = v.count
    end
  end

  def unique_visits(data)
    data.each do |k, v|
      data[k] = v.uniq.count
    end
  end

  def print_result(freq, uniq_freq)
    visit_freq = freq.sort_by { |_, v| -v }.to_h.each { |k, v| puts "#{k} #{v} visits" }
    uniq_visit_freq = uniq_freq.each { |k, v| puts "#{k} #{v} unique visits" }

    [visit_freq, uniq_visit_freq]
  end
end
