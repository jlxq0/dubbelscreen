class CreateDatasources < ActiveRecord::Migration
  def change
    create_table :datasources do |t|
      t.string :name
      t.references :datasourcetype, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
