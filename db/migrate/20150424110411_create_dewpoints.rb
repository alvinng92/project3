class CreateDewpoints < ActiveRecord::Migration
  def change
    create_table :dewpoints do |t|
      t.decimal :value
      t.references :observation, index:true

      t.timestamps null: false
    end
    add_foreign_key :dewpoints, :observations
  end
end
