class CreateWindDirections < ActiveRecord::Migration
  def change
    create_table :wind_directions do |t|
      t.string :value
      t.references :observation, index:true

      t.timestamps null: false
    end
    add_foreign_key :wind_directions, :observations
  end
end
