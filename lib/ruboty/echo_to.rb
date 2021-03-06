require 'ruboty'
require 'ruboty/echo_to/version'

module Ruboty
  module Handlers
    class EchoTo < Base
      on(
        /echo_to\s+#(.+?)\s+(.*)/m,
        name: 'echo_to',
        description: 'send your message to another channel'
      )

      def echo_to(message)
        class << message
          def reply_to!(channel, text)
            @original[:from] = new_to(channel)
            @original[:type] = 'groupchat'
            reply(text)
          end

          def new_to(channel)
            "#{channel}@conference.#{ENV['SLACK_TEAM']}.xmpp.slack.com/#{ENV['SLACK_USERNAME']}"
          end
        end
        message.reply_to!(message.match_data[1],
                          message.match_data[2])
      end

      # for debug
      def et_debug(message)
        class << message
          def debug
            text = "original------\n" \
            "from: #{@original[:from]}\n" \
            "to: #{@original[:to]}\n" \
            "type: #{@original[:type]}\n" \
            "#{new_to('channel')}"
            reply(text)
          end

          def new_to(channel)
            "#{channel}@conference.#{ENV['SLACK_TEAM']}.xmpp.slack.com/#{ENV['SLACK_USERNAME']}"
          end
        end
        message.debug
      end
    end
  end
end
