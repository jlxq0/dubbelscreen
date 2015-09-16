class CreateNewschannels < ActiveRecord::Migration
  def change
    create_table :newschannels do |t|
      t.string :name
      t.string :feedurl

      t.timestamps null: false
    end
  end
end
