require 'ruboty'
require "ruboty/echo_channel/version"

module Ruboty
  module Handlers
    class EchoChannel < Base
      on(
        /echo_to\s+#(.+?)\s+(.*)/m,
        name: 'echo_to',
        description: 'repeat your message'
      )

      def echo_to(message)
        class << message
          def to
            match_data[1] + @original[:to].split('@')[1]
          end
        end
        message.reply(message.match_data[2])
        message.reply("to\t#{message.to}")
        message.reply("match_data[1]\t#{match_data[1]}")
        message.reply("match_data[2]\t#{match_data[2]}")
      end
    end
  end
end
