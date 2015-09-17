class CreatePlexmedia < ActiveRecord::Migration
  def change
    create_table :plexmedia do |t|
      t.references :plexserver, index: true, foreign_key: true
      t.string :mediatype
      t.string :key
      t.string :title

      t.timestamps null: false
    end
  end
end
