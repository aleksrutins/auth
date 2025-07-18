class ProfileController < ApplicationController
  include Gravatar
  def index
    render Views::Profile::Index.new(
      user: Current.user,
      profile: gravatar_profile(Current.user.email_address))
  end
end
