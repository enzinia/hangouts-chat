[![Gem Version](https://badge.fury.io/rb/hangouts-chat.svg)](https://badge.fury.io/rb/hangouts-chat)
[![Build Status](https://travis-ci.org/enzinia/hangouts-chat.svg?branch=master)](https://travis-ci.org/enzinia/hangouts-chat)
[![Maintainability](https://api.codeclimate.com/v1/badges/c6106eab23781ab0be46/maintainability)](https://codeclimate.com/github/enzinia/hangouts-chat/maintainability)
[![Inline docs](http://inch-ci.org/github/enzinia/hangouts-chat.svg?branch=master)](http://inch-ci.org/github/enzinia/hangouts-chat)

# Hangouts Chat gem
Send messages to [Hangouts Chat](https://gsuite.google.com/products/chat/) rooms using incoming webhooks.

## Installation
```
$ gem install hangouts-chat
```

or add to your Gemfile

```
gem 'hangouts-chat'
```

## Usage
```ruby
require 'hangouts_chat'
```
### Simple Text Message
Simple messages that appear inline as if typed by a user. Details and format: [Simple Text Messages](https://developers.google.com/hangouts/chat/reference/message-formats/basic)
```ruby
sender = HangoutsChat::Sender.new 'webhook_URL'
sender.simple 'text'
```

### Card Message
More complex messages that have UI elements with actions and HTML support. Details and format: [Card messages](https://developers.google.com/hangouts/chat/reference/message-formats/cards)
```ruby
sender = HangoutsChat::Sender.new 'webhook_URL'
header = { title: 'Pizza Bot Customer Support',
           subtitle: 'pizzabot@example.com',
           imageUrl: 'https://goo.gl/aeDtrS' }
sections = [{ widgets: [{ keyValue: { topLabel: 'Order No.', content: '12345' } },
                        { keyValue: { topLabel: 'Status', content: 'In Delivery' } }] }]

sender.card(header, sections)
```

### Message to thread

```ruby
# Create new thread
sender = HangoutsChat::Sender.new 'webhook_URL'
res = sender.simple 'text'

# Response parse
res_json = JSON.parse(res.body)
thread_name = res_json.dig("thread", "name") #=> "spaces/SPACES_ID/threads/THREADS_ID"

# Send to thread (simple)
sender.simple('res message', thread: thread_name)

# Send to thread (card)
header = {...}
sections = {...}
sender.card(header, sections, thread: thread_name)
```

### How to get Webhook URL
1. Open channel to which you want to send messages
2. Click on the channel name in top bar and select 'Configure webhooks'
3. Click on 'Add webhook' and fill name for bot, that will be display messages
4. Click on 'Save' and copy 'Webhook URL'

Details: [Setting up an incoming webhook](https://developers.google.com/hangouts/chat/how-tos/webhooks)

## Contributing
Please feel free to contribute any changes, that you want too see in this gem.
Feature requests are also accepted.

Before Pull Request submitting please check
* Changed or added code has tests and YARD documentation
* All tests are pass
* `rubocop` doesn't report any offenses

## Tests
All tests are use usual Minitest `assert` syntax.
To run tests execute `rake tests`.

## Changelog
Changelog is available [here](CHANGELOG.md).
