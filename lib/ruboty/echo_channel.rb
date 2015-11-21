require 'ruboty'
require 'ruboty/echo_channel/version'

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
          def modify_to!
            @original[:to] = new_to
          end

          def new_to
            [match_data[1], @original[:to].split('@')[1]].join('@')
          end
        end
        message.modify_to!
        message.reply(message.match_data[2])
      end
    end
  end
end
