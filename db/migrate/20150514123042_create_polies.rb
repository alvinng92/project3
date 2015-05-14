class CreatePolies < ActiveRecord::Migration
  def change
    create_table :polies do |t|

      t.timestamps null: false
    end
  end
end
