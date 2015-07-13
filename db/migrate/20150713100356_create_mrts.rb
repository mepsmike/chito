class CreateMrts < ActiveRecord::Migration
  def change
    create_table :mrts do |t|
      t.string :name
      t.integer :line_no
      t.string :line
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
