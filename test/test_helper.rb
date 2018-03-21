require 'minitest/autorun'
require 'webmock/minitest'
require 'hangouts-chat'

WebMock.disable_net_connect!(net_http_connect_on_start: true)
