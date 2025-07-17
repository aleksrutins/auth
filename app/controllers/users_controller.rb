class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    render Views::Users::New.new
  end

  def create
    if params[:password] != params[:password_confirmation]
      redirect_to new_user_path, alert: 'Passwords do not match.'
      return
    end
    user = User.new(params.permit(:email_address, :password))
    if user.save
      start_new_session_for user
      redirect_to after_authentication_path
    else
      redirect_to new_user_path, alert: 'Something went wrong. Please try again.'
    end
  end
end
