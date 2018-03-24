require_relative 'hangouts_chat/version'
require_relative 'hangouts_chat/http'

# Main namespace
module HangoutsChat
  # Provide methods to send messages to Hangouts Chat rooms using webhooks API
  class Sender
    # Creates Sender object
    # @param webhook_url [String] URL for incoming webhook
    def initialize(webhook_url)
      @url = webhook_url
      @http = HTTP.new(@url)
    end

    # Sends Simple Text Message
    # @param text [String] text to send to room
    # @return [Net::HTTPResponse] response object
    def simple(text)
      payload = { text: text }
      @http.post payload
    end
  end
end
