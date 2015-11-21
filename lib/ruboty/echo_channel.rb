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

      def echo_to(message)
        class << message
          def reply_to!(channel, text)
            @original[:from] = new_to(channel)
            reply(text)
          end

          def new_to(channel)
            [channel, @original[:from].split('@')[1]].join('@')
          end
        end
        message.reply_to!(message.match_data[1],
                          message.match_data[2])
      end
    end
  end
end
