class CreateWindDirPreds < ActiveRecord::Migration
  def change
    create_table :wind_dir_preds do |t|

      t.timestamps null: false
    end
  end
end
