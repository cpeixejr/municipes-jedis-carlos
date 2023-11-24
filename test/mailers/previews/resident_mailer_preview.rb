class ResidentMailerPreview < ActionMailer::Preview
  def welcome
    resident = Resident.first
    ResidentMailer.welcome(resident)
  end
end
