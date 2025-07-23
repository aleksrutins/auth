class VerificationCode < ApplicationRecord
  belongs_to :user
  has_secure_token :code
end
