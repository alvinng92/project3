class CreateJsonOuts < ActiveRecord::Migration
  def change
    create_table :json_outs do |t|

      t.timestamps null: false
    end
  end
end
