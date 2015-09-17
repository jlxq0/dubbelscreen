class CreatePlexservers < ActiveRecord::Migration
  def change
    create_table :plexservers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :url
      t.string :port
      t.string :token
      t.string :shows_lib
      t.string :movies_lib

      t.timestamps null: false
    end
  end
end
