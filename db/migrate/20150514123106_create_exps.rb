class CreateExps < ActiveRecord::Migration
  def change
    create_table :exps do |t|

      t.timestamps null: false
    end
  end
end
