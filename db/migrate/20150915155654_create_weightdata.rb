class CreateWeightdata < ActiveRecord::Migration
  def change
    create_table :weightdata do |t|
      t.references  :person, index: true, foreign_key: true
      t.datetime    :withings_taken_at
      t.integer     :withings_attribution
      t.integer     :withings_category
      t.float       :withings_weight
      t.integer     :withings_size
      t.float       :withings_fat
      t.float       :withings_ratio
      t.float       :withings_fat_free
      t.float       :withings_diastolic_blood_pressure
      t.float       :withings_systolic_blood_pressure
      t.integer     :withings_heart_pulse

      t.timestamps null: false
    end
  end
end


