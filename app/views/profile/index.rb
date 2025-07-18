class Views::Profile::Index < Views::Base
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def view_template
    div {
      img(src: gravatar_url(@user.email_address))
      h1 { @user.email_address }
    }
  end
end
