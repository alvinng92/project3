class CreateLocationsListToJsons < ActiveRecord::Migration
  def change
    create_table :locations_list_to_jsons do |t|

      t.timestamps null: false
    end
  end
end
