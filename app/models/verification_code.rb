class VerificationCode < ApplicationRecord
  belongs_to :users
  has_secure_token :code
end
