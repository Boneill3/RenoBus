class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.belongs_to :path
      t.decimal :lat, precision: 10, scale: 6, null: false
      t.decimal  :lon, precision: 10, scale: 6, null: false

      t.timestamps
    end
  end
end
