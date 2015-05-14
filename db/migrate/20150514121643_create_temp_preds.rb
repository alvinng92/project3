class CreateTempPreds < ActiveRecord::Migration
  def change
    create_table :temp_preds do |t|

      t.timestamps null: false
    end
  end
end
