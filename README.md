# Hangouts Chat gem
Send messages to Hangouts Chat rooms using incoming webhooks.

## How to use
```
sender = HangoutsChat::Sender.new 'webhook URL'
sender.simple 'text'
```
## Comments
For now supported only [Simple Text Messages](https://developers.google.com/hangouts/chat/reference/message-formats/basic)

## TODO
* Add tests
* Add docs
* Errors reports
* Support [Card messages](https://developers.google.com/hangouts/chat/reference/message-formats/cards)
* README badges etc
