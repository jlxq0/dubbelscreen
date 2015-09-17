class CreateNewschannels < ActiveRecord::Migration
  def change
    create_table :newschannels do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :feedurl

      t.timestamps null: false
    end
  end
end
