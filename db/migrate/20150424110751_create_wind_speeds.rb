class CreateWindSpeeds < ActiveRecord::Migration
  def change
    create_table :wind_speeds do |t|
      t.decimal :value
      t.references :observation, index:true

      t.timestamps null: false
    end
    add_foreign_key :wind_speeds, :observations
  end
end
