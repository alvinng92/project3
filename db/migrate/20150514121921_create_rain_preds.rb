class CreateRainPreds < ActiveRecord::Migration
  def change
    create_table :rain_preds do |t|

      t.timestamps null: false
    end
  end
end
