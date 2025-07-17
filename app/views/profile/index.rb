class Views::Profile::Index < Views::Base
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def view_template
    h1 { @user.email_address }
  end
end
