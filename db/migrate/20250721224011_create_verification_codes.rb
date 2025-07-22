class CreateVerificationCodes < ActiveRecord::Migration[8.0]
  def change
    create_table :verification_codes do |t|
      t.references :users, null: false, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
