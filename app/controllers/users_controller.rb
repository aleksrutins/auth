class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    render Views::Users::New.new
  end

  def create
    if params[:password] != params[:password_confirmation]
      redirect_to new_user_path, alert: "Passwords do not match."
      return
    end
    user = User.new(params.permit(:email_address, :password))
    if user.save
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_user_path, alert: "Something went wrong. Please try again."
    end
  end

  def start_verify
    code = VerificationCode.new(user_id: Current.user.id)
    if code.save
      VerificationMailer.verify(code).deliver_later
      render Views::Users::Verify.new
    else
      print code.users_id, code.code
      redirect_to root_url, alert: "Something went wrong. Please try again later."
    end
  end

  def verify
    code = VerificationCode.where(code: params[:code])
    code.take.user.update(verified: true)
    code.destroy_all
    redirect_to root_url
  end
end
