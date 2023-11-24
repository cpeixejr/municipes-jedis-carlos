class SendWelcomeSMSJob
  include Sidekiq::Job
  def perform(resident_id)
    return unless resident_id

    return unless (resident = Resident.find(resident_id))

    TwilioTextMessenger.new('Cadastro realizado com sucesso! Jedis Team', resident.phone).call
  end
end
