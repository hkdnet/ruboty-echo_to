require 'ruboty'
require 'ruboty/echo_channel/version'

module Ruboty
  module Handlers
    class EchoChannel < Base
      on(
        /echo_to\s+#(.+?)\s+(.*)/m,
        name: 'echo_to',
        description: 'repeat your message to another channel'
      )
      on(
        /et_debug/,
        name: 'et_debug',
        description: 'for debug'
      )

      def echo_to(message)
        class << message
          def reply_to!(channel, text)
            @original[:from] = new_to(channel)
            reply(text)
          end

          def new_to(channel)
            "#{channel}@conference.#{ENV['SLACK_TEAM']}.xmpp.slack.com/#{ENV['SLACK_USERNAME']}"
          end
        end
        message.reply_to!(message.match_data[1],
                          message.match_data[2])
      end
      def et_debug(message)
        class << message
          def debug
            "from: #{@original[:from]}\n" \
            "to: #{@original[:to]}\n"
          end
        end
        message.reply(message.debug)
      end
    end
  end
end
