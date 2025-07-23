class VerificationMailer < ApplicationMailer
  def verify(code)
    @user = User.find(code.user_id)
    @verify_url = url_for("/verify?code=#{code.code}")
    mail subject: "Verify your account", to: @user.email_address
  end
end
