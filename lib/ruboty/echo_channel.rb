require 'ruboty'
require "ruboty/echo_channel/version"

module Ruboty
  module Handlers
    class EchoChannel < Base
      on(
        /echo\s+(#.*)\s+(.*)/m,
        name: 'echo',
        description: 'repeat your message'
      )

      def echo(message)
        class << message
          def to
            match_data[1] + @original[:to].split('@')[1]
          end
        end
        message.reply(message.match_data[2])
      end
    end
  end
end
