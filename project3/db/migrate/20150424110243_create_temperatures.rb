class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.decimal :value
      t.references :observation, index:true

      t.timestamps null: false
    end
    add_foreign_key :temperatures, :observations
  end
end
