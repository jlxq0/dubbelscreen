class CreatePlexservers < ActiveRecord::Migration
  def change
    create_table :plexservers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :url
      t.integer :port
      t.string :token
      t.string :shows_library
      t.string :movies_library

      t.timestamps null: false
    end
  end
end
