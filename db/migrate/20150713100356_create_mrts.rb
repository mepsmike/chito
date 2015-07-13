class CreateMrts < ActiveRecord::Migration
  def change
    create_table :mrts do |t|

      t.timestamps null: false
    end
  end
end
