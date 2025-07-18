module ApplicationHelper
  def gravatar_hash(email)
    Digest::SHA256.hexdigest(email.strip.downcase)
  end

  def gravatar_url(email)
    "https://0.gravatar.com/avatar/#{self.gravatar_hash(email)}"
  end
end
