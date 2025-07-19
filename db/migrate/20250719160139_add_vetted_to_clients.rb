class AddVettedToClients < ActiveRecord::Migration[8.0]
  def change
    add_column :clients, :vetted, :boolean, default: false
  end
end
