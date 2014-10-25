class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :tag, null: false
      t.string :title, null: false
      t.string :stop_id, null: false
      t.decimal :lat, null: false, precision: 10, scale: 6 
      t.decimal :lon, null: false, precision: 10, scale: 6 

      t.timestamps
    end
  end
end
