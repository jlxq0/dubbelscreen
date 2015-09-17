class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.decimal :lat
      t.decimal :long

      t.timestamps null: false
    end
  end
end
