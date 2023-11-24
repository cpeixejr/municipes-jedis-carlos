class TwilioTextMessenger
  attr_reader :message

  def initialize(message, phone_number)
    @message = message
    @phone_number = phone_number
  end

  def call
    TwilioClient.instance.client.messages.create(
      from: Rails.application.credentials[Rails.env.to_sym].twilio_phone_number,
      to: @phone_number,
      body: @message
    )
  end
end
