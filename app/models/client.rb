class Client < ApplicationRecord
  has_secure_token :client_secret
end
