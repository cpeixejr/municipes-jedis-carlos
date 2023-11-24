require 'cpf_cnpj'

class Resident < ApplicationRecord
  include CNS
  mount_uploader :avatar, AvatarUploader
  paginates_per 10

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_one :address
  validates :full_name, :cpf, :cns, :email, :birth_date, :phone, presence: true
  validates_format_of :email, with: EMAIL_REGEX
  validate :cpf_is_valid?, :cns_is_valid?, :birth_date_is_valid?
  accepts_nested_attributes_for :address

  after_save :send_email_and_sms

  def cpf_is_valid?
    errors.add(:cpf, 'CPF invalido') unless CPF.valid?(cpf)
  end

  def cns_is_valid?
    errors.add(:cns, 'CNS invalido') unless CNS.validate(cns)
  end

  def birth_date_is_valid?
    return unless birth_date.nil? || (birth_date > Date.today) || (Date.today.year - birth_date.year > 120)

    errors.add(:birth_date,
               'Data de Nascimento inválida')
  end

  def send_email_and_sms
    SendWelcomeEmailJob.perform_async(id)
    SendWelcomeSMSJob.perform_async(id)
  end
end
