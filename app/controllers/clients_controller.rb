class ClientsController < ApplicationController
  def new
    render Views::Clients::New.new
  end
  def create
    client = Client.new(params.permit(:name, :description, :support_url, :require_verification))
    client.user_id = Current.user.id
    if (Current.user.verified or Rails.env.development?) and client.save
      redirect_to root_url
    else
      redirect_to new_client_path, alert: "Something went wrong."
    end
  end
end
