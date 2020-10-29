require "slack-notify"
require 'clockwork'
require 'active_support/time'

def second_job
  sample = SlackNotify::Client.new(webhook_url: ENV['WEBHOOK'])
  sample.notify("Hello There!")
end
module Clockwork
  handler do |job|
    case job
    when 'hoge.job'
      second_job
    end
  end
every(10.seconds, 'hoge.job')
end
