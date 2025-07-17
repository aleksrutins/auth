class Views::Profile::Index
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def render
    "<h1>#{user.name}'s Profile</h1>"
  end
end
