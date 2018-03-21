require 'test_helper'

class HTTPTest < Minitest::Test
  def setup
    @url = 'https://example.com'
    @http = HangoutsChat::Sender::HTTP.new(@url)
  end

  def test_initialized_with_valid_uri
    uri = @http.instance_variable_get(:@uri)
    assert_equal 'https', uri.scheme
    assert_equal 'example.com', uri.host
  end

  def test_initialized_with_valid_post_request
    req = @http.instance_variable_get(:@req)
    assert_equal 'POST', req.method
    assert_equal 'application/json', req['Content-Type']
  end

  def test_post_request
    stub_request(:any, @url)
    payload = 'Test text'

    @http.post(payload)

    assert_requested :post, @url, times: 1, body: payload.to_json, headers:
      { 'Content-Type' => 'application/json' }
    assert_not_requested :get, @url
  end
end
