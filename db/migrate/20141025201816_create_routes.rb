class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :tag, null: false
      t.string :title, null: false
      t.string :color, null: false
      t.string :opposite_color, null: false
      t.decimal :lat_min, precision: 10, scale: 6, null: false
      t.decimal :lat_max, precision: 10, scale: 6, null: false
      t.decimal :lon_min, precision: 10, scale: 6, null: false
      t.decimal :lon_max, precision: 10, scale: 6, null: false

      t.timestamps
    end
  end
end
