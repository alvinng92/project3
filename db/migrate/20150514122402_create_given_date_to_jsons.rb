class CreateGivenDateToJsons < ActiveRecord::Migration
  def change
    create_table :given_date_to_jsons do |t|

      t.timestamps null: false
    end
  end
end
