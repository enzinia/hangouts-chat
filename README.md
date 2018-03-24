# Hangouts Chat gem
Send messages to [Hangouts Chat](https://gsuite.google.com/products/chat/) rooms using incoming webhooks.

## Installation
```
$ gem install hangouts-chat
```

or add to your Gemfile

```ruby
require 'hangouts-chat'
```

## Usage
```ruby
sender = HangoutsChat::Sender.new 'webhook_URL'
sender.simple 'text'
```

### How to get Webhook URL
1. Open channel to which you want to send messages
2. Click on the channel name in top bar and select 'Configure webhooks'
3. Click on 'Add webhook' and fill name for bot, that will be display messages
4. Click on 'Save' and copy 'Webhook URL'

Details: [Setting up an incoming webhook](https://developers.google.com/hangouts/chat/how-tos/webhooks)


## Comments
For now supported only [Simple Text Messages](https://developers.google.com/hangouts/chat/reference/message-formats/basic)

## TODO
* Errors reports
* Support [Card messages](https://developers.google.com/hangouts/chat/reference/message-formats/cards)
* README badges etc
