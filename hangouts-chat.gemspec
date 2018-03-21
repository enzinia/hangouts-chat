Gem::Specification.new do |s|
  s.name        = 'hangouts-chat'
  s.version     = '0.0.1'
  s.date        = '2018-03-20'
  s.summary     = 'Send messages to Hangouts Chat rooms using incoming webhooks'
  s.description = 'Send messages to Hangouts Chat rooms using incoming webhooks'
  s.authors     = ['enzinia']
  s.email       = 'vkukovskij@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://github.com/enzinia/hangouts-chat'
  s.license     = 'MIT'

  s.add_development_dependency 'webmock'
end
