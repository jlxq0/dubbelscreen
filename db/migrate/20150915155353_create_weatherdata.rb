class CreateWeatherdata < ActiveRecord::Migration
  def change
    create_table :weatherdata do |t|
      t.decimal :temperature
      t.datetime :time
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
