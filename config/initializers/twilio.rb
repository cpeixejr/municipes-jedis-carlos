require 'twilio-ruby'

class TwilioClient
  include Singleton

  def client
    @client ||= Twilio::REST::Client.new Rails.application.credentials[Rails.env.to_sym].twilio_account_sid,
                                         Rails.application.credentials[Rails.env.to_sym].twilio_auth_token
  end
end
