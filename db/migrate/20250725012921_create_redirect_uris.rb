class CreateRedirectUris < ActiveRecord::Migration[8.0]
  def change
    create_table :redirect_uris do |t|
      t.references :client, null: false, foreign_key: true
      t.string :uri

      t.timestamps
    end
  end
end
