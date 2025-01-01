require 'nkf'
class Order < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, email_format: true
  validates :phone, presence: true, length: { maximum: 15 }, numericality: { only_integer: true }
  validates :delivery_address, presence: true, length: { maximum: 255 }

  after_initialize :format_phone
  after_initialize :format_email

  private

  def format_phone
    return if phone.blank?

    self.phone = phone.tr('０-９', '0-9').delete('^0-9')
  end

  def format_email
    return if email.blank?

    self.email = NKF.nkf('-w -Z4', email)
  end

end
