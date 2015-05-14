class CreateCurveFits < ActiveRecord::Migration
  def change
    create_table :curve_fits do |t|

      t.timestamps null: false
    end
  end
end
