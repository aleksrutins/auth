class VerificationMailer < ApplicationMailer
  def verify(code)
    @user = User.find(code.user_id)
    @verify_url = url_for(controller: "users",
                          action: "verify",
                          code: code.code,
                          host: ENV["APP_HOST"] || ENV["RAILWAY_PUBLIC_DOMAIN"] || "localhost")
    mail subject: "Verify your account", to: @user.email_address
  end
end
