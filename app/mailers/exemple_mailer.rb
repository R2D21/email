require 'mailjet'

class ExampleMailer < ActionMailer::Base

  #  The Send API v3.1 sends a collection of messages, added in JSON array, called Messages. The input payload must starts with 
  def sample_email(user)
    Mailjet.configure do |config|
      config.api_key = ENV['MJ_APIKEY_PUBLIC']
      config.secret_key = ENV['MJ_APIKEY_PRIVATE']  
      config.api_version = "v3.1"
    end
    variable = Mailjet::Send.create(messages: [{
                                                 'From'=> {
                                                   'Email'=> 'remi50avJ.C@live.fr',
                                                   'Name'=> 'Mailjet Pilot'
                                                 },
                                                 'To'=> [
                                                   {
                                                     'Email'=> 'gayih@travala10.com',
                                                     'Name'=> 'passenger 1'
                                                   }
                                                 ],
                                                 'Subject'=> 'Your email flight plan!',
                                                 'TextPart'=> 'Dear passenger 1, welcome to Mailjet! May the delivery force be with you!',
                                                 'HTMLPart'=> '<h3>Dear passenger 1, welcome to Mailjet!</h3><br />May the delivery force be with you!'
                                               }]
                                   )
    p variable.attributes['Messages']
  end
end
