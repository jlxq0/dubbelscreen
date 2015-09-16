class CreateWeatherdata < ActiveRecord::Migration
  def change
    create_table :weatherdata do |t|
      t.references :location, index: true, foreign_key: true
      t.date     :date
      t.integer  :high
      t.integer  :low
      t.datetime :sunrise
      t.datetime :sunset
      t.string   :icon
      t.string   :condition

      t.timestamps null: false
    end
  end
end
