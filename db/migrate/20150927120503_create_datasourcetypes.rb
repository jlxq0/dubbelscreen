class CreateDatasourcetypes < ActiveRecord::Migration
  def change
    create_table :datasourcetypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
