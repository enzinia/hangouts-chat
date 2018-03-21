require_relative 'hangouts_chat/version'
require_relative 'hangouts_chat/http'

module HangoutsChat
  class Sender
    def initialize(webhook_url)
      @url = webhook_url
      @http = HTTP.new(@url)
    end

    def simple(text)
      payload = { text: text }
      @http.post payload
    end
  end
end
