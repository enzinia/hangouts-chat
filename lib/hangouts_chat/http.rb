require 'net/http'
require 'json'

module HangoutsChat
  class Sender
    # Unsuccessful respond exception
    class APIError < StandardError; end

    # Service class to send HTTP POST requests
    class HTTP
      # Creates HTTP::Post object with JSON content type
      # @param url [String] URL to send request
      def initialize(url)
        @uri = URI(url)
        @req = Net::HTTP::Post.new(@uri)
        @req['Content-Type'] = 'application/json'
      end

      # Sends HTTP POST request
      # @param payload [String] request body to send
      # @return [Net::HTTPResponse] response object
      def post(payload)
        @req.body = payload.to_json

        Net::HTTP.start(@uri.hostname, @uri.port, :ENV, use_ssl: true) do |http|
          http.request(@req)
        end
      end
    end
  end
end
