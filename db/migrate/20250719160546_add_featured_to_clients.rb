class AddFeaturedToClients < ActiveRecord::Migration[8.0]
  def change
    add_column :clients, :featured, :boolean, default: false
  end
end
