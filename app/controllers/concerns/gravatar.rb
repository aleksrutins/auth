# frozen_string_literal: true
require 'http'

module Gravatar
  include ActiveSupport::Concern

  private

  def gravatar_hash(email)
    Digest::SHA256.hexdigest(email.strip.downcase)
  end

  def gravatar_profile(email)
    user = User.where(email_address: email)
    return JSON.parse(user.pluck('profile').take(1)[0]) if user.where.not(profile: nil).exists?
    profile = JSON.parse(
      HTTP.auth("Bearer #{ENV["GRAVATAR_API_KEY"]}")
          .get("https://api.gravatar.com/v3/profiles/#{gravatar_hash(email)}")
          .to_s)
    user.update_all(profile: profile.to_json)
    return profile
  end
end
