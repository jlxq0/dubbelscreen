class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :newschannel, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
