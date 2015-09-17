class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.references :user, index: true, foreign_key: true
      t.string :nickname
      t.string :fullname
      t.date :birthday
      t.integer :height
      t.string :withings_id
      t.string :withings_key
      t.string :withings_secret

      t.timestamps null: false
    end
  end
end
