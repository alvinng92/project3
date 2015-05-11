class CreateRainfalls < ActiveRecord::Migration
  def change
    create_table :rainfalls do |t|
      t.decimal :value
      t.references :observation, index:true

      t.timestamps null: false
    end
    add_foreign_key :rainfalls, :observations
  end
end
