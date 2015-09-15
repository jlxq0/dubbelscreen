class CreateWeightdata < ActiveRecord::Migration
  def change
    create_table :weightdata do |t|
      t.decimal :weight
      t.datetime :time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
