class VerificationMailer < ApplicationMailer
  def send(code)
    @user = User.find(code.users_id)
    @verify_url = url_for("/users/verify?code=#{code.code}")
    mail subject: "Verify your account", to: @user.email_address
  end
end
