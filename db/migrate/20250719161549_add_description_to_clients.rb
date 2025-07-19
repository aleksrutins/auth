class AddDescriptionToClients < ActiveRecord::Migration[8.0]
  def change
    add_column :clients, :description, :string
  end
end
