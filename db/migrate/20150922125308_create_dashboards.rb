class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
