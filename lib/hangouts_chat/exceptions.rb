require 'net/http/response'

module HangoutsChat
  class Sender
    # Unsuccessful API respond exception
    class APIError < StandardError
      # Creates exception object with generated message
      # @param response [Net::HTTPResponse] API response
      def initialize(response)
        msg = "HTTP #{response.code} #{response.msg}\n"
        msg += "Body:\n#{response.body}"
        super(msg)
      end
    end
  end
end
