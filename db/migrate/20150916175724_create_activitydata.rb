class CreateActivitydata < ActiveRecord::Migration
  def change
    create_table :activitydata do |t|
      t.references :user, index: true, foreign_key: true
      t.date       :withings_taken_at
      t.integer    :withings_steps
      t.float      :withings_distance
      t.float      :withings_calories
      t.float      :withings_totalcalories
      t.float      :withings_elevation
      t.integer    :withings_soft
      t.integer    :withings_moderate
      t.integer    :withings_intense

      t.timestamps null: false
    end
  end
end
