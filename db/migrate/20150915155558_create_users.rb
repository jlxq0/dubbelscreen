class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :fullname
      t.date :birthday
      t.integer :height

      t.timestamps null: false
    end
  end
end
