class AddClientsPrimaryKey < ActiveRecord::Migration[8.0]
  def change
    add_index :clients, :id, unique: true
  end
end
