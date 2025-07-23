class Client < ApplicationRecord
  self.primary_key = :id
  has_secure_token :client_secret
  before_create :generate_id

  private

  def generate_id
    self.id = SecureRandom.uuid if self.id.blank?
  end
end
