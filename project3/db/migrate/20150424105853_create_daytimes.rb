class CreateDaytimes < ActiveRecord::Migration
  def change
    create_table :daytimes do |t|
      t.string :date
      t.string :time
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :daytimes, :locations
  end
end
