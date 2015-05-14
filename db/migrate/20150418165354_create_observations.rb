class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :source
      t.decimal :rain_since_9am
      t.decimal :temp
      t.decimal :dewpoint
      t.string :wind_dir
      t.integer :wind_spd_kph
      t.references :daytime, index: true

      t.timestamps null: false
    end
    add_foreign_key :observations, :daytimes
  end
end
