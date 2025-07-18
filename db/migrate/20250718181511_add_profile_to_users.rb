class AddProfileToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :profile, :json, default: nil
  end
end
