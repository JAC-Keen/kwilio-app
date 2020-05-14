require 'twilio-ruby'
require 'keen'

# put your own twilio credentials here
account_sid = 'abc'
auth_token = '123'

# put your own keen credentials here
Keen.project_id = "project_id_goes_here"
Keen.write_key = "write_key_goes_here"

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# define your variables
sender = '+0000000000'
recipient = '+1111111111'
message_body = 'Hey Keenster, this is a test sms from your Twilio and Keen Integration App!'

# twilio api call
@client.messages.create(
  from: sender,
  to: recipient,
  body: message_body
)

# keen api call
Keen.publish(:twilio_sms,{
  :from => sender,
  :to => recipient,
  :body => message_body
  })
