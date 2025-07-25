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

  def show
    render Views::Clients::Show.new(Client.find(params[:id]))
  end

  def edit
    client = Client.find(params[:id])
    if client.user_id == Current.user.id
      render Views::Clients::Edit.new(client)
    else
      redirect_to client_path(client.id), alert: "Kwaheri rafiki!" # thanks osticket
    end
  end
end
