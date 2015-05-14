class CreateWindSpeedPreds < ActiveRecord::Migration
  def change
    create_table :wind_speed_preds do |t|

      t.timestamps null: false
    end
  end
end
