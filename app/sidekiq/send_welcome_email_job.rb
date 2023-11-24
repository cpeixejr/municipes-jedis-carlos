class SendWelcomeEmailJob
  include Sidekiq::Job

  def perform(resident_id)
    return unless resident_id

    return unless (resident = Resident.find(resident_id))

    ResidentMailer.welcome(resident).deliver_now
  end
end
