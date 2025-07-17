class Views::Profile::Index < Phlex::HTML
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def view_template
    h1 { @user.email }
  end
end
