require 'test_helper'

class HangoutsChatTest < Minitest::Test
  def setup
    @webhook_url = 'https://chat.googleapis.com/v1/spaces/space_id/' \
                   'messages?key=secret_key&token=secret_token'
    @sender = HangoutsChat::Sender.new(@webhook_url)
  end

  def test_initialized_with_valid_variables
    url = @sender.instance_variable_get(:@url)
    http = @sender.instance_variable_get(:@http)
    assert_equal @webhook_url, url
    assert_equal HangoutsChat::Sender::HTTP, http.class
  end

  def test_simple_message_request
    stub_request(:any, /chat\.googleapis\.com/).to_return(status: 200)
    message = 'Test simple message'

    @sender.simple(message)

    assert_requested :post, @webhook_url, times: 1, body:
      { text: message }.to_json
  end
end
