require_relative 'hangouts_chat/version'
require_relative 'hangouts_chat/http'
require_relative 'hangouts_chat/exceptions'

# Main namespace
module HangoutsChat
  # Provide methods to send messages to Hangouts Chat rooms using webhooks API
  class Sender
    # @return [String] Webhook URL, given on initialization
    attr_reader :url

    # Creates Sender object
    # @param webhook_url [String] URL for incoming webhook
    def initialize(webhook_url)
      @url = webhook_url
      @http = HTTP.new(@url)
    end

    # Sends Simple Text Message
    # @param text [String] text to send to room
    # @param thread [String] it will be sent as a reply (`nil` is a new thread will be created)
    # @return [Net::HTTPResponse] response object
    def simple(text, thread: nil)
      payload = { text: text }
      send_request(payload, thread: thread)
    end

    # Sends Card Message
    # @since 0.0.4
    # @param header [Hash] card header content
    # @param sections [Array<Hash>] card widgets array
    # @param thread [String] it will be sent as a reply (`nil` is a new thread will be created)
    # @return [Net::HTTPResponse] response object
    def card(header, sections, thread: nil)
      payload = { cards: [header: header, sections: sections] }
      send_request(payload, thread: thread)
    end

    private

    # Sends payload and check response
    # @param payload [Hash] data to send by POST
    # @param thread [String] it will be sent as a reply (`nil` is a new thread will be created)
    # @return [Net::HTTPResponse] response object
    # @raise [APIError] if got unsuccessful response
    def send_request(payload, thread: nil)
      payload[:thread] = { name: thread } if thread

      response = @http.post payload
      raise APIError, response unless response.is_a?(Net::HTTPSuccess)
      response
    end
  end
end
