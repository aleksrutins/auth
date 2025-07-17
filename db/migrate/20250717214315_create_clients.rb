class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true
      t.text :name, null: false
      t.string :client_secret, null: false
      t.text :support_url, null: false
      t.boolean :require_verification, default: false, null: false # for apps requiring more security, e.g. Pacuare

      t.timestamps
    end
  end
end
