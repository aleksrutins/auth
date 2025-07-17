class ProfileController < ApplicationController
  def index
    render Views::Profile::Index.new(user: Current.user)
  end
end
