class CreateGivenLatLongPeriods < ActiveRecord::Migration
  def change
    create_table :given_lat_long_periods do |t|

      t.timestamps null: false
    end
  end
end
