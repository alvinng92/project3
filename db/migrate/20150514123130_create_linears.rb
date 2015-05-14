class CreateLinears < ActiveRecord::Migration
  def change
    create_table :linears do |t|

      t.timestamps null: false
    end
  end
end
