class ResidentMailer < ApplicationMailer
  def welcome(resident)
    @resident = resident
    bootstrap_mail(
      to: @resident.email,
      subject: 'Welcome to Jedis Proj'
    )
  end
end
