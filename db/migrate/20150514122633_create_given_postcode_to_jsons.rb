class CreateGivenPostcodeToJsons < ActiveRecord::Migration
  def change
    create_table :given_postcode_to_jsons do |t|

      t.timestamps null: false
    end
  end
end
