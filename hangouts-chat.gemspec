$LOAD_PATH << File.expand_path('lib', __dir__)
require 'hangouts_chat/version'

Gem::Specification.new do |s|
  s.name        = 'hangouts-chat'
  s.version     = HangoutsChat::VERSION
  s.summary     = 'Library for sending messages to Hangouts Chat rooms'
  s.description = 'Send messages to G Suite Hangouts Chat rooms using ' \
                  'incoming webhooks and Net::HTTP::Post'
  s.authors     = ['enzinia']
  s.email       = 'vkukovskij@gmail.com'
  s.homepage    = 'https://github.com/enzinia/hangouts-chat'
  s.license     = 'MIT'

  s.files       = Dir['lib/**/*.rb'] +
                  ['CHANGELOG.md', 'LICENSE', 'README.md', 'Rakefile']
  s.test_files  = Dir['test/**/*.rb']

  s.add_development_dependency 'rubocop', '<= 0.54.0'
  s.add_development_dependency 'webmock', '~> 3'
  s.add_development_dependency 'yard',    '~> 0.9', '> 0.9.11'
end
